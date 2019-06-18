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
        self.assignments = None
        self.course_names = {
            "SuaCode Africa 1":"",
            "SuaCode Africa 2":"",
            "SuaCode Africa 3":"",
        }
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
        self.drive = Drive()
        # self.mailer = Mail()
        # self.sheet = Sheets()

    def download_files(self, files_info):
        """ Download necessary files to be graded """
        click.echo("Downloading assignment files ...")

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
            a = sub["assignmentSubmission"]["attachments"]

            if a:
                # Loop through attachments
                for f in a:         
                    final = {}
                    drive_file = f["driveFile"]
                    
                    if drive_file["title"][-4:] == ".pde":
                        final["submissionNo"] = sub_no
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

    def get_names_from_number(self, **kwargs):
        values = {}
        if "assignment" in list(kwargs.keys()):
            assignment = int(kwargs.get("assignment"))
            values["assignment"] = sorted(list(self.assg_names.keys()))[assignment - 1]
        if "course" in list(kwargs.keys()):
            cn = int(kwargs.get("course"))
            values["course"] = sorted(list(self.course_names.keys()))[cn - 1]
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

                            id = name.split('_')[0]
                            final = { 'sub':submission_num, 'details': { 'id':id, 'score':score, 'errors':errors } }
                            all.append(final)

                        except Exception as e:
                            f = open(os.path.join(self.BASE_DIR, "grading_errors.txt"), 'a')
                            f.writelines(['',name.strip('"')])
                            f.close()

                            print("There was an error processing the script. Error:"+ str(e) )

                break
        self.log_to_file(all,"results.json")
        print(all)
        return all

    def add_to_classroom(self, course_num, assignment_num, sub_id, grade):
        course_id = self.course_ids[course_num - 1]
        
        # Get dict of assignment names and assignment id
        assg_name = self.get_names_from_number(assignment=assignment_num)
        assg_id = self.assignment_ids[ assg_name ]

        try: 
            body={ 'draftGrade': 16 }
            results = self.teacher.grade_submissions(course_id, assg_id, sub_id, body)
        except:
            print("Could not add to classroom")

    def add_to_sheets(self):
        # Return results to sheets
        pass


# ------------------------------------ #
NO_OF_ASSIGNMENTS = 6
NO_OF_ALLOWED_RESUBS = 5
NIL = 'nil'

ALLOWED_ASSIGNMENTS = list(str(i) for i in range(1, NO_OF_ASSIGNMENTS+1))
ALLOWED_RESUBS = list(str(i) for i in range(1, NO_OF_ALLOWED_RESUBS+1))

docs = {
    "deploy":"Run and upload",
    "course": "Specify the course. 1 for Suacode Africa 1, 2 for Suacode Africa 2,etc. Additionally \
        you can specify multiple courses. Eg. --course_number=1,2,3 to pull assignments for course 1, 2 and 3",
    "assignment":"Specify the assignment you want to grade.",
    "submission": "Specify whether you're grading first submissions or resubs. Eg. --submission=2",
    "file": "Specify the path of file to be graded offline Eg. --file=pong_1/assignment_1/assignment_1.pde"
}
   
@click.group(invoke_without_command=True)
@click.option('--file', '-f', help=docs["file"])
@click.option('--submission', '-s', type=click.Choice( ALLOWED_RESUBS ), default="1", help=docs["submission"])
@click.option('--course', '-c', help=docs["course"])
@click.option('--assignment', '-a', type=click.Choice( ALLOWED_ASSIGNMENTS ),  help=docs["assignment"])
@click.pass_context
def cli(context, course, assignment, submission, file):
    context.ensure_object(dict) #

    # Attach the inputs to context object
    context.obj['course'] = course or NIL
    context.obj['assignment'] = assignment or NIL
    context.obj['submission'] = submission or NIL
    context.obj['file'] = file or NIL

    if context.invoked_subcommand is None:
        click.echo("[TEST] Running AutoGrad..")
        a = AutoGrad()

        # a.boot() # Connect to Google APIs. This is not needed when testing
        # subs =  a.get_submissions_for_assignment(course, assignment, submission) # Get turned in submissions
        # at = a.get_files_for_download(subs) # Get the .pde files
        # a.log_to_file(at) # Logs to temporary.json. You can provide a file name as the second argument for a different file. eg. log_to_file(at, "kofi.json")
        # downloaded = a.download_files(at) # Download the files to assets/code
        # click.echo("Files to be graded are in {}".format(a.file_path))

        results = a.grade_files(assignment_num=assignment, course_num=course, submission_num=submission)

        # Submit results
        # if len(results) > 0:    
        #     for obj in results:
        #         grade = obj['details']['score']
        #         a.add_to_classroom(course, assignment, sub_id, score)


@cli.command()
@click.pass_context
def deploy(context):
    """Run complete process"""
    check_required = NIL not in list(context.obj.values())
   
    if check_required: 
        a = context.obj['AutoGrad']
        course = context.obj['course']
        assignment = context.obj['assignment']
        submission = context.obj['submission']
    
        click.echo("[DEPLOY] Running AutoGrad..")
        # a = AutoGrad()
        # subs = a.get_submissions_for_assignment(course, assignment)
        # at = a.get_files_for_download(subs)
        # a.log_to_file(at)
    else:
        click.echo("Insufficient params. Exiting.. Try --help for more info")

if __name__ == "__main__":
    cli(obj={})
        


