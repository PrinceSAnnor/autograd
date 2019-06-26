# main autograd script
from classroom.modules.Teacher import Teacher
from modules.Drive import Drive
from modules.Mail import Mail
from modules.Sheets import Sheets

import os, subprocess, sys, csv, json, click, random, shutil
from datetime import datetime
from googleapiclient.errors import HttpError


class AutoGrad(object):
    """ AutoGrad """

    def __init__(self):
        """ Make initialisations here """
        cwd = os.getcwd()
        self.BASE_DIR = cwd
        self.code_dir = os.path.join(self.BASE_DIR, 'assets', 'code')
        
        self.teacher = None
        self.drive = None
        self.mailer = None
        self.sheet = None

        self.TURNED_IN = "TURNED_IN"
        self.current_assg = ""
        self.file_path = os.path.join(self.code_dir, 'temp')
        self.attachments = []
        self.course_ids = []
        self.submissions = {}
        self.assignments = {}
        self.get_code_assgs = ['3','4','5']
        self.course_names = {
            "SuaCode Africa 1":"",
            "SuaCode Africa 2":"",
            "SuaCode Africa 3":"",
        }
        self.names_vs_ids = dict.fromkeys( self.course_names.keys(), {} )

        self.assg_names = {
            'Assignment 1 - Make Pong Interface':'',
            'Assignment 2 - Move ball':'',
            'Assignment 3 - Bounce Ball':'',
            'Assignment 4 - Move Paddles':'',
            'Assignment 5 - Add Extra Ball':'',
            'Assignment 6 - Add More Balls':''
        }
        self.sub_order = {'1': 0, '2': 1}
        # self.boot()

    def __str__(self):
        click.echo("Starting AutoGrad in this dir: {}".format(self.BASE_DIR))
    
    def boot(self):
        """ Connect to API services """
        # create a required instances
        self.teacher = Teacher()
        # self.drive = Drive()
        # self.mailer = Mail()
        # self.sheet = Sheets()

    def download_files(self, files_info):
        """ Download necessary files to be graded """
        click.echo("Downloading assignment files ...")
        
        self.drive = Drive() # Connect to Drive
      
        c = n = len(files_info)
        keys = sorted(list(self.course_names.keys()))
        vals = sorted(list(self.course_names.values()))

        for i, f in enumerate(files_info):         
            while True:
                self.file_path = self.code_dir + '/%s/%s/%s' % (self.current_assg, keys[vals.index(f['courseId'])], f['submissionNo'] )
                self.file_path.replace('/', os.sep)

                os.chdir(self.BASE_DIR) # Get into root dir everytime you have to save a file to prevent saving deep down a tree
                if not os.path.exists(self.file_path) and os.getcwd() != self.file_path:
                    os.makedirs(self.file_path)
                os.chdir(self.file_path)                                 
                try:
                    new_file_name = f['userId'] + '_' + str(f['submissionNo']) + '_' + f['title']
                    new_file_dir = new_file_name.split('.pde')[0]
                    old_file_name = f['title']

                    if os.path.exists(new_file_dir): # If the file has not been downloaded create a new folder, otherwise recycle the old
                        self.recycle(os.path.join(self.file_path, new_file_dir)) # Clear folder first
                    os.makedirs(new_file_dir)
                    os.chdir(new_file_dir) 

                    self.drive.get_file(f['id'], f['title'])
                    os.rename(old_file_name, new_file_name)

                    print("Progress: Downloaded {} out of {} file(s) ".format(i,n), end="\r\n", flush=True)
                except Exception as e:
                    c -= 1
                    click.echo("There was an error downloading. Error: {}".format(e))
                break  

        click.echo("Finished downloading {}/{} files".format(c, n))
        return c

    def get_submissions_for_assignment(self, course_number, assignment_number, submission_number):      
        """ Returns TURNED_IN submissions from one assignment of specified course/classroom(s) """
        subs_list = []
        
        def has_state_history(s, submission_number):
            count = 0
            eligible = len(s['submissionHistory']) > 1

            for history in s['submissionHistory']:
                if history.get('stateHistory', {}).get('state') == self.TURNED_IN:
                    count += 1
            if eligible:
                # EDITED: Return based on specified
                if submission_number == count: #== 1: # Return only first submissions.
                    s['submissionNo'] = count
                    return True
                
                # elif submission_number > 1 and count >= submission_number: # Return any other submissions made later
                #     s['submissionNo'] = count
                #     return True
            return False

        # type cast id
        assignment_number = int(assignment_number)
        submission_number = int(submission_number)

        # Get dict of course name and course id
        courses = self.teacher.get_all_courses() 

        # get multiple course numbers if given
        if "," in course_number:
            course_number = tuple(int(n.strip()) for n in course_number.split(',') )
        else: 
            course_number = tuple(course_number)

        # Get course ids for selected courses eg. suacode 1 and 2 
        try:
            for ck in courses.keys():
                if ck in self.course_names:
                    self.course_names[ck] = courses[ck]

            # Keeping ids for later
            vals = sorted(list(self.course_names.values()))
            course_number = sorted(course_number)
            if len(course_number) > 1:
                res = zip(course_number, vals)
                cn, cv = zip(*res)
            else:
                cv = (vals[int(course_number[0])-1],)
    
            self.course_ids = cv
            print(self.course_ids)
        except Exception as e:
            click.echo("Could not get courses. Make sure you type a correct course number.\nTry 'autograd.py --help' for details")
            click.echo("Exception: {}".format(e))
            raise
        
        for id in self.course_ids:   
            # Get dict of assignment names and assignment id
            self.assignments = self.teacher.get_all_assignment_ids(id)

            try:
                # Get assignment id for selected assignment to be graded
                assg_name = sorted(list(self.assg_names.keys()))[assignment_number-1]
                assg_id = self.assignments[ assg_name ]

                self.assg_names[assg_name] = assg_id # add it to the dict beside the name

                # This is name of current assignment being graded
                self.current_assg = assg_name 
            except Exception as e:
                click.echo("Could not get assignment {}".format(assignment_number))
                raise e

            subs_list += self.teacher.get_student_submissions(id, assg_id, states=[self.TURNED_IN]).get('studentSubmissions', [])
            
        turned_in_subs = list(filter(lambda s: has_state_history(s, submission_number), subs_list))        
        return turned_in_subs

    def get_files_for_download(self, subs):
        click.echo("Getting filenames from Google for download ...")

        def get_PDE(sub):
            user_id = sub["userId"]
            course_id = sub["courseId"]
            sub_no = sub["submissionNo"]
            sub_id = sub["id"]
            a = sub["assignmentSubmission"]["attachments"]

            if a:
                # Loop through attachments
                for f in a:         
                    final = {}
                    drive_file = f["driveFile"]
                    
                    if drive_file["title"][-4:] == ".pde":
                        self.submissions[user_id] = sub_id # Store a ref to sub_ids. This came later

                        final["submissionNo"] = sub_no
                        final["subId"] = sub_id
                        final["userId"] = user_id
                        final["courseId"] = course_id
                        final["id"] = drive_file["id"]
                        final["title"] = drive_file["title"]
                        final["driveFile"] = drive_file["alternateLink"]
                        return final
                        
            else:
                return {}

        attachments = list(map( lambda sub: get_PDE(sub) ,subs))
        attachments = list(filter( lambda s: s != None, attachments))
        self.attachments = attachments # Attach to instance
        click.echo("Retrieved {} filename(s)".format(len(attachments)))
       
        return attachments

    def log_to_file(self, info, file_name="temporary.json"):
        try:
            f = open(file_name, "w")
            json.dump(info, f)
            f.close()
            return True
        except:
            return False

    def load_names_from_csv(self, course_name):
        os.chdir(self.BASE_DIR)
        click.echo("No info for {}. Loading info..\n".format(course_name) )
        try:
            with open('assets/students-details/%s.csv' % (course_name) ) as csvfile:
                readCSV = csv.reader(csvfile, delimiter=',')
                for row in readCSV:
    
                    student_firstname = f'{row[0]}'.strip()
                    student_lastname = f'{row[1]}'.strip()
                    student_name = f'{row[2]}'.strip()
                    student_id = f'{row[3]}'.strip()
                    student_email = f'{row[4]}'.strip()

                    self.names_vs_ids[course_name][student_id] = {'student_firstname':student_firstname, 'student_name':student_firstname, 'student_email':student_email}
                return True
        except Exception as e:
            click.echo("There was an error loading the student details. Error: {}".format( str(e) ))
            return False
        
    def get_names_from_number(self, **kwargs):
        values = {}
        # Get the assignment name from self.assg_names
        if "assignment" in list(kwargs.keys()):
            assignment = int(kwargs.get("assignment"))
            values["assignment"] = sorted(list(self.assg_names.keys()))[assignment - 1]
        
        # Get course name from self.course_names
        if "course" in list(kwargs.keys()):
            cn = int(kwargs.get("course"))
            values["course"] = sorted(list(self.course_names.keys()))[cn - 1]
        
        # Get the user details from the csv
        if "user_details"  in list(kwargs.keys()):
            user_details = kwargs.get('user_details')
            
            user_course = user_details.get('user_course')
            user_id = user_details.get('user_id')

            names_loaded_for_particular_course = len(self.names_vs_ids.get(user_course)) > 1
                     
            if not names_loaded_for_particular_course: 
            # This runs only the first time in a grading cycle. Subsequent times loads names from memory.              
                self.load_names_from_csv(user_course)


            def get_detail(course, id, fields):
                d = {}
                ids_vs_fields = self.names_vs_ids.get(user_course, {}).get(id)
                
                for item in fields:
                    d[item] = ids_vs_fields.get(item)
                return d
            
            details = get_detail(user_course, user_id, ['student_firstname', 'student_email' ])
            values = { 'student_firstname': details['student_firstname'], 'student_email': details['student_email'] }

        return values

    def recycle(self, src):
      
        r = str(random.randint(0,1000))
        dst = os.path.join(self.BASE_DIR, 'assets', 'recycle', r)  
        try:
            # There is code to be recycled from last grading
            if not os.path.exists(dst) and os.path.exists(src): os.makedirs(dst)
            shutil.move(src,dst)
        except:
            pass

    def grade_files(self, course_num, assignment_num, submission_num, move=True):
        
        # Run grading for a file
        click.echo("Grading files...")
        print("Move after grading is set to {}".format(move))
        final = {}
        all = []
        
        # If there are multiple course numbers get them out into a list
        if "," in course_num:
            cns = course_num.split(",")
        else:
            cns = list(course_num)

        # Loop through course numbers and grade
        for course_number in cns:
            while True:
                info = self.get_names_from_number(assignment=assignment_num, course=course_number)

                os.chdir(self.BASE_DIR)
                code_dir = 'assets{}code'.format(os.sep)
                if not os.path.exists(code_dir):
                    os.makedirs(code_dir)
                
                fp = os.path.join(code_dir, info['assignment'], info['course'], submission_num) # '115758346753638427969_1_Assignment3')

                # List all files in dir
                for root, dirs, files in os.walk(fp):
                    for name in dirs: 
                        self.file_path = os.path.join(fp, name)
                        click.echo("Grading {}".format(self.file_path))
                        assignment_sketch = name + '.pde'
                        sketch_dir = os.path.join(os.getcwd(), 'pong_{}'.format(assignment_num)) # os.path.join(os.getcwd(), self.file_path)
                        build_dir = os.path.join(sketch_dir, 'build')

                        get_code_dir = os.path.join(sketch_dir, 'get_code')
                        get_code_build = os.path.join(get_code_dir, 'build')

                        sketch_path = os.path.join(self.file_path, assignment_sketch)

                        get_code_cmd = 'processing-java --sketch="{}" --output="{}" --force --run "{}"'\
                            .format(get_code_dir , get_code_build, sketch_path)

                        processing_cmd = 'processing-java --sketch="{}" --output="{}" --force --run "{}"'\
                            .format(sketch_dir, build_dir, sketch_path) # Remove first pong_X directory later on when old autograd is phased out
                    
                        # Run getcode to make getters and setters
                        if assignment_num in self.get_code_assgs:
                            print("Parsing and Preparing Code.pde file")
                            results = subprocess.check_output(get_code_cmd , shell=True)
                            output = results.decode("UTF-8")
                            print(output)

                        # Run Processing test and grade
                        try:
                            results = subprocess.check_output(processing_cmd , shell=True)

                            output = results.decode("UTF-8")
                            res = output.replace('Finished.', '')
                            score = res.split()[0]
                            errors = res[3:].replace('[','').replace(']','')

                            when = datetime.today().strftime('%Y-%m-%d-%H:%M:%S')

                            user_id = name.split('_')[0]
                            final = { 'sub':submission_num, 'when':when, 'assignment':info['assignment'] ,'details': { 'course': info['course'],'userId':user_id, 'score':score, 'errors':errors } }
                            all.append(final)

                            p = '_'.join((course_num,assignment_num, submission_num))
                            graded = os.path.join(self.BASE_DIR, 'assets','graded',p)
                            
                            if not os.path.exists(graded):
                                os.makedirs(graded)

                            elif move.lower() == 'true':
                                click.echo("Moving {} to /assets/graded".format(self.file_path))
                                shutil.move(self.file_path, graded)

                        except Exception as e:
                            with open(os.path.join(self.BASE_DIR, "grading_errors.txt"), 'a') as f:
                                f.writelines([name.strip('"'),'\n'])

                            print("There was an error processing the script. Error:"+ str(e) )

                break
        if all:
            logged = self.log_to_file(all,"results.json")
            if logged: self.save_grading_info(course_num, assignment_num ,submission_num)
    
        return all

    def attach_ids(self, *args):
        p = '_'.join(args)
        dir = os.path.join(self.BASE_DIR, 'logs', p)
        results_json =  os.path.join(dir, 'results.json')
        temporary_json = os.path.join(dir, 'temporary.json')

        if not os.path.exists(temporary_json) or not os.path.exists(results_json):
            click.echo("Path: {} or {} may not exist. You must have graded submissions before submitting locally stored results.\
                 Run auto.py with grade-download".format(temporary_json, results))
            return False

        with open(results_json, 'r') as f, open(temporary_json, 'r') as g:
            results = json.load(f)
            temporary = json.load(g)

            for obj in results:
                userId = obj['details']['userId']
                for item in temporary:
                    if userId == item['userId']:
                        obj['submissionId'] = item['subId']
                        obj['courseId'] = item['courseId']
                        del item
        return results

    def add_to_classroom(self, course_num, assignment_num, results, return_grade=False):
        if len(results) > 0:    
            for obj in results:
                
                grade = obj['details']['score']
                user_id = obj['details']['userId']
                sub_id = self.submissions.get(user_id) or obj['submissionId']

                course_id = obj.get('courseId', sorted(list(self.course_names.values()))[int(course_num) - 1])

                assg_name = self.get_names_from_number(assignment=assignment_num)['assignment']

                # Get dict of assignment names and assignment id
                if self.assignments.get(assg_name) == None and self.teacher == None: # We're probably running locally
                    self.teacher = Teacher()
                    self.assignments = self.teacher.get_all_assignment_ids(course_id)
                assg_id = self.assignments.get(assg_name)

                try: 
                    click.echo("Sending results to Classroom..")
                    
                    body={ 'draftGrade': grade }
                    if return_grade: body['assignedGrade'] = grade
                    results = self.teacher.grade_submissions(course_id, assg_id, sub_id, body)
                    click.echo('Posted in classroom for {}'.format(user_id))  
                except Exception as e:
                    with open(os.path.join(self.BASE_DIR, "upload_errors.txt"), 'a') as f:
                        f.writelines([user_id,'\n'])
                    print("Could not add to classroom : "+str(e))
                    
            return True    

    def add_to_sheets(self):
        # Return results to sheets
        pass

    def send_mail(self, results=[]):
        """
        Sends mail to the student. Has to be supplied the results object from grade_files()
        """

        #prepare mail message
        message = "Hi {},\n\nGood job!\nYou can can check your grade now.\n Grade: {}\n\nSee below the things you missed, if any. You can fix them and resubmit only one more time for a better grade by the deadline posted on the classroom page.\nAsk any questions if they aren’t clear. \n\nPlease correct the following mistakes \n\n"
            
        if( results and len(results) > 0 ):                                                
            # Connect to Mail
            self.mailer = Mail()

            for obj in results:
                while True:

                    grade = int(obj['details']['score'])
                    user_id = obj['details']['userId']
                    user_course = obj['details']['course'] 
                    errors = obj['details']['errors']
                    assignment = obj['assignment']

                    user_details ={'user_id':user_id, 'user_course':user_course }

                    student_details = self.get_names_from_number(user_details=user_details)
                    student_firstname = student_details['student_firstname'] or user_id

                    message = message.format(student_firstname, grade)    
                    errors = errors.split(',')
                    message += ''.join(list(map(lambda err: err+'\n' ,errors)))

                    # upload the results
                    click.echo("Sending mail...")
                    try: 
                        no_of_submissions = int(obj.get('sub'))
                        if no_of_submissions < 2:
                            student_email = student_details['student_email'] 
                            title = "Results for {}".format(assignment)
                            self.mailer.send_message(student_email, title, message)
                            print("Mail sent successfully to {}".format(student_email))
                        else: print("This is a second submission. Did not send mail.")
                    except HttpError as e:
                        print("Sending mail unsuccessful")
                        error = json.loads(e.content).get('error')
                        print(error)
                    break
        else:
            click.echo("Done. There were no results to mail.")
            return False   
        return True     

    def submit(self, course, assignment, results, return_grade=False):
        """
        Returns draftGrade to classroom and sends mail to the student
        TODO: Submit to Sheets
        """
        # Return draft grade to classroom
        if len(results) > 0:
            added = self.add_to_classroom(course, assignment, results, return_grade)
        else:
            return False

        # Send mail
        if added: self.send_mail(results=results)
        else: 
            click.echo("could not add to classroom")
            return False
        return True

    def retrieve(self, course, assignment, submission):
        """
        Connects to Google Drive and downloads files for submissions that have been turned in.

        Submission number supplied to this method will determine which submission is retrieved eg. '1' for first submission
        '2' for second submission and '3' , '4',etc for subsequent ones.

        Additionally it logs to temporary.json the files that were discovered.
        """

        self.boot() # Connect to Google APIs. This is not needed when testing
        
        subs =  self.get_submissions_for_assignment(course, assignment, submission) # Get turned in submissions
        at = self.get_files_for_download(subs) # Get the .pde file attachments
        self.log_to_file(at) # Logs to temporary.json. You can provide a file name as the second argument for a different file. eg. log_to_file(at, "kofi.json")
        downloaded = self.download_files(at) # Download the files to assets/code
        
        click.echo("Files to be graded are in {}".format(self.file_path))
        return True

    def save_grading_info(self, *args):

        # when = datetime.today().strftime('%Y-%m-%d-%H:%M:%S').replace(':','-')
        to_save = ['grading_errors.txt', 'results.json', 'temporary.json']

        if args: p = '_'.join(args)
        else: p = 'temp'
        dst = os.path.join(self.BASE_DIR, 'logs', p)
        for file in os.listdir(self.BASE_DIR):
            
            if file in to_save and os.path.exists(os.path.join(self.BASE_DIR, file) ):
                src = os.path.join(self.BASE_DIR, file)
                print("Found "+src)
                
                final = os.path.join(dst,file)

                try:
                    if not os.path.exists(dst):
                        os.makedirs(dst)
                        print("Moving from {} to {}".format(src, dst))
                        shutil.move(src, dst)
                    elif file == 'results.json' and os.path.exists(final):
                        print("Appending results..")
                        buffer = os.path.join(dst,'temp.json')
                        with open(src,'r') as s, open(final,'r+') as d, open(buffer,'w') as t:
                            new_results = json.loads(s.read())
                            old_results = json.loads(d.read())
                            for obj in new_results: 
                                old_results.append(obj) 
                            json.dump(old_results, t)
                        shutil.move(buffer, final)
                        self.recycle(src) # Recycle the results.json
                    else:
                        print("Dir exists. Overwriting {} to {}".format(src, dst))
                        shutil.move(src, final)
                        self.recycle(src)
                except Exception as e:
                    print("There was an error moving/appending results. {}".format(str(e)))

    def deploy(self, course, assignment, submission, move, return_grade=False):
        # Download and store files
        self.retrieve(course, assignment, submission)
        
        # Results of grading. Stored in results.json also
        results = self.grade_files(course, assignment, submission, move)

        # Submit results
        submitted = self.submit(course, assignment, results, return_grade)

        # Save grading errors (unable to grade) and info on scripts successfully graded
        if submitted: self.save_grading_info(course, assignment, submission)