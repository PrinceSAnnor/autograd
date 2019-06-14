# main autograd script
from classroom.modules.Teacher import Teacher
from modules.Drive import Drive
from modules.Mail import Mail
from modules.Sheets import Sheets

import os, subprocess, sys, csv, json, click
from datetime import datetime
from googleapiclient.errors import HttpError


class AutoGrad(object):
    """ AutoGrad """

    def __init__(self):
        """ Make initialisations here """
        cwd = os.getcwd()
        self.BASE_DIR = cwd
        self.classroom = None
        self.drive = None
        self.mailer = None
        self.sheet = None
        self.TURNED_IN = "TURNED_IN"
        self.assg_name = ""
        self.file_path = os.path.join(self.BASE_DIR,'assets','code','temp')
        self.attachments = []
        self.course_ids = []
        self.course_names = {
            "SuaCode Africa 1":"",
            "SuaCode Africa 2":"",
            "SuaCode Africa 3":"",
        }
        self.assg_names = (
            ('Assignment 1 - Make Pong Interface'),
            ('Assignment 2 - Move ball'),
            ('Assignment 3 - Bounce Ball'),
            ('Assignment 4 - Move Paddles'),
            ('Assignment 5 - Add Extra Ball'),
            ('Assignment 6 - Add More Balls')
        )
        self.sub_order = {'1': 0, '2': 1}
        # self.boot()

    def __str__(self):
        click.echo("Starting AutoGrad in this dir:{}".format(self.BASE_DIR))
    
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
        
        c = n = len(files_info)
        keys = sorted(list(self.course_names.keys()))
        vals = sorted(list(self.course_names.values()))

        for i, f in enumerate(files_info):         
            while True:
                self.file_path = 'assets/code/%s/%s/%s' % (self.assg_name, keys[vals.index(f['courseId'])], f['submissionNo'] )
                

                os.chdir(self.BASE_DIR) # Get into root dir everytime you have to save a file to prevent saving deep down a tree
                if not os.path.exists(self.file_path) and os.getcwd != file_path:
                    os.makedirs(self.file_path)
                os.chdir(self.file_path)                                 
                try:
                    new_file_name = f['userId'] + '_' + str(f['submissionNo']) + '_' + f['title']
                    old_file_name = f['title']
                    self.drive.download_file(f['id'], f['title'])
                    os.rename(old_file_name, new_file_name)
                    print("Progress: Downloaded {} out of {} file(s)".format(i,n), end="\r", flush=True)
                except Exception as e:
                    c -= 1
                    click.echo("There was an error downloading. Error: {}".format(e))
                break  

        click.echo("Finished downloading {}/{} files".format(c, n))
        return True

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
                if submission_number == count == 1:
                    s['submissionNo'] = count
                    return True
                
                elif submission_number > 1 and count >= submission_number: 
                    s['submissionNo'] = count
                    return True
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
            assignments = self.teacher.get_all_assignment_ids(id)

            try:
                # Get assignment id for selected assignment to be graded
                assg_name = self.assg_names[assignment_number-1]
                assg_id = assignments[ assg_name ]
                self.assg_name = assg_name 
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

    def grade_files(self, course_number=0, assignment_number=0, submission_number=0):
        # Run grading for a file
        os.chdir(self.BASE_DIR)
        # if os.path.isfile('assets{}code'.format(os.sep))

        # get_code_cmd = 'processing-java --sketch="' + self.BASE_DIR + os.sep + pong_code[assignment_number] + '/get_code" --output="' + self.BASE_DIR + '/' + pong_code[assignment_number] + os.sep+ 'get_code/build"' + ' --force --run ' + args
        processing_cmd = 'processing-java --sketch="{}" --output="{}" --force --run "{}"'\
            .format( os.path.join(os.getcwd(), 'pong_1' ),
            os.path.join(os.getcwd(), 'pong_1', 'build'),
            os.path.join('pong_1', 'assignment_1', 'assignment_1.pde')) # Remove first pong_X directory later on when old autograd is phased out
        
        print(processing_cmd)

        results = subprocess.check_output(processing_cmd , shell=True)
        output = results.decode("UTF-8")
        res = output.replace('Finished.', '')
        print(res.split()[0])
                              
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
    "test":"Run without uploading",
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

        a.boot() # Connect to Google APIs. This is not needed when testing
        subs =  a.get_submissions_for_assignment(course, assignment, submission) # Get turned in submissions
        at = a.get_files_for_download(subs) # Get the .pde files
        a.log_to_file(at) # Logs to temporary.json. You can provide a file name as the second argument for a different file. eg. log_to_file(at, "kofi.json")
        status = a.download_files(at) # Download the files to assets/code

        # a.grade_files()

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
        click.echo("Insufficient params exiting.. Try --help for more info")

if __name__ == "__main__":
    cli(obj={})
        


