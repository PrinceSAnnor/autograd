# main autograd script
from classroom.modules.Teacher import Teacher
from modules.Drive import Drive
from modules.Mail import Mail
from modules.Sheets import Sheets

import os, subprocess, sys, csv, json, click, random
from datetime import datetime
from googleapiclient.errors import HttpError


class AutoGrad(object):
    """ AutoGrad """

    def __init__(self):
        """ Make initialisations here """
        cwd = os.getcwd()
        self.BASE_DIR = cwd
        self.code_dir = os.path.join(self.BASE_DIR, 'assets', 'code')
        
        self.classroom = None
        self.drive = None
        self.mailer = None
        self.sheet = None

        self.TURNED_IN = "TURNED_IN"
        self.current_assg = ""
        self.file_path = os.path.join(self.code_dir, 'temp')
        self.attachments = []
        self.course_ids = []
        self.submissions = {}
        self.assignments = None
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
        if os.path.exists(self.code_dir): self.recycle(self.code_dir) # Clear folder first
        
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

                    if not os.path.exists(new_file_dir):
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
        self.attachments = attachments # Attach to instance
        click.echo("Retrieved {} filename(s)".format(len(attachments)))
       
        return attachments

    def log_to_file(self, info, file_name="temporary.json"):
        f = open(file_name, "w")
        json.dump(info, f)
        f.close()

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
        import shutil

        r = str(random.randint(0,1000))
        dst = os.path.join(self.BASE_DIR, 'assets', 'recycle', r)  
        try:
            # There is code to be recycled from last grading
            if not os.path.exists(dst) and os.path.exists(self.code_dir): os.makedirs(dst)
            shutil.move(src,dst)
        except:
            pass

    def grade_files(self, course_num='1,2', assignment_num='3', submission_num='1'):
        # Run grading for a file
        click.echo("Grading files...")

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

                            user_id = name.split('_')[0]
                            final = { 'sub':submission_num, 'assignment':info['assignment'] ,'details': { 'course': info['course'],'userId':user_id, 'score':score, 'errors':errors } }
                            all.append(final)

                        except Exception as e:
                            f = open(os.path.join(self.BASE_DIR, "grading_errors.txt"), 'a')
                            f.writelines([name.strip('"'),'\n'])
                            f.close()

                            print("There was an error processing the script. Error:"+ str(e) )

                break
        self.log_to_file(all,"results.json")
        print(all)
        return all

    def add_to_classroom(self, course_num, assignment_num, results, return_grade=False):
        if len(results) > 0:    
            for obj in results:
                grade = obj['details']['score']
                user_id = obj['details']['userId']
                sub_id = self.submissions.get(user_id)
    
        course_id = self.course_ids[int(course_num) - 1]
        
        # Get dict of assignment names and assignment id
        assg_name = self.get_names_from_number(assignment=assignment_num)['assignment']
        assg_id = self.assignments.get(assg_name)

        try: 
            click.echo("Sending results to Classroom..")
            body={ 'draftGrade': grade }
            results = self.teacher.grade_submissions(course_id, assg_id, sub_id, body)
        except Exception as e:
            print("Could not add to classroom: "+str(e))

    def add_to_sheets(self):
        # Return results to sheets
        pass

    def send_mail(self, results=[]):
        """
        Sends mail to the student. Has to be supplied the results object from grade_files()
        """

        #prepare mail message
        message = "Hi %s, Did you miss me? :D\n\nGood job!\nYou can can check your grade now.\n Grade: %d\n\nSee below the things you missed. You can fix them and resubmit only one more time for a better grade by the deadline posted on the classroom page.\nAsk any questions if they aren’t clear. \n\nPlease correct the following mistakes \n\n"
            
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

                    message = message % (student_firstname, grade)    
                    errors = errors.split(',')
                    message += ''.join(list(map(lambda err: err+'\n' ,errors)))

                    # upload the results
                    click.echo("Sending mail...")
                    try: 
                        no_of_submissions = int(obj.get('sub'))
                        if no_of_submissions < 2:
                            student_email = student_details['student_email']
                            title = "Results for %s" % (assignment)
                            self.mailer.send_message(student_email, title, message)
                            print("Mail sent successfully")
                        else: print("This is a second submission. Did not send mail.")
                    except HttpError as e:
                        print("Sending mail unsuccessful")
                        error = json.loads(e.content).get('error')
                        print(error)
                    break
        else:
            click.echo("Done. There were no results to mail.")
            return False        

    def submit(self, course, assignment, results):
        """
        Returns draftGrade to classroom and sends mail to the student
        TODO: Submit to Sheets
        """
        # Return draft grade to classroom
        self.add_to_classroom(course, assignment, results)

        # Send mail
        self.send_mail(results=results)


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

    def deploy(self, course, assignment, submission, results):
            # Download and store files
            self.retrieve(course, assignment, submission)
            
            # Results of grading. Stored in results.json also
            results = self.grade_files(assignment_num=assignment, course_num=course, submission_num=submission)

            # Submit results
            self.submit(course, assignment, results)