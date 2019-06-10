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

        self.classroom = None
        self.drive = None
        self.mailer = None
        self.sheet = None
        self.TURNED_IN = "TURNED_IN"
        self.attachments = []
        self.course_names = (
            ("SuaCode Africa 1"),
            ("SuaCode Africa 2"),
            ("SuaCode Africa 3"),
        )
        self.assg_names = (
            ('Assignment 1 - Make Pong Interface'),
            ('Assignment 2 - Move ball'),
            ('Assignment 3 - Bounce Ball'),
            ('Assignment 4 - Move Paddles'),
            ('Assignment 5 - Add Extra Ball'),
            ('Assignment 6 - Add More Balls')
        )
        self.boot()
    
    def boot(self):
        """ Connect to API services """
        
        # create a required instances
        self.teacher = Teacher()
        # self.drive = Drive()
        # self.mailer = Mail()
        # self.sheet = Sheets()


    def download_files(self, assignment_ids):
        """ Download necessary files to be graded """
        

    def progress(self, i):
        """ TODO: remove this into an external file"""
        print("Progress: Retrieved {} file(s)".format(i), end="\r", flush=True)


    def get_submissions_for_assignment(self, course_number, assignment_number):      
        """ Returns TURNED_IN submissions from one assignment of specified course/classroom(s) """

        def has_turned_in_and_has_state_history(s):
            return s['state'] == self.TURNED_IN and len(s['submissionHistory']) > 1
           
        # type cast id
        assignment_number = int(assignment_number)

        # Get dict of course name and course id
        courses = self.teacher.get_all_courses() 

        # get multiple course numbers if given
        if "," in course_number:
            course_number = tuple(int(n.strip()) for n in course_number.split(',') )
        else: 
            course_number = tuple(course_number)

        # Get course ids for selected courses eg. suacode 1 and 2 
        try:
            course_ids = tuple(map(lambda cn: courses[self.course_names[ int(cn)-1]], course_number))
        except:
            click.echo("Could not get courses.\nMake sure you type a correct course number. Try 'autograd.py --help' for details")
        
        
        for id in course_ids:      
            # Get dict of assignment names and assignment id
            assignments = self.teacher.get_all_assignment_ids(id)

            try:
                # Get assignment id for selected assignment to be graded
                assg_name = self.assg_names[assignment_number-1]
                assg_id = assignments[ assg_name ]
            except:
                click.echo("Could not get assignment {}".format(assignment_number))
            #click.echo( assg_name +":"+assg_id)

            subs = self.teacher.get_student_submissions(id,assg_id).get('studentSubmissions', [])
            turned_in_subs = list(filter(lambda s: has_turned_in_and_has_state_history(s) ,subs))
            
            return turned_in_subs


    def get_files_for_download(self, subs):
        click.echo("Getting filenames from Google for download ...")

        def getPDE(sub):
            userId = sub["userId"]
            a = sub["assignmentSubmission"]["attachments"]

            if a:
                # Loop through attachments
                for f in a:         
                    final = {}
                    driveFile = f["driveFile"]
                    
                    if driveFile["title"][-4:] == ".pde":
                        final["userId"] = userId
                        final["driveFile"] = driveFile["alternateLink"]
                        return final
            else:
                return {}

        attachments = list(map( lambda sub: getPDE(sub) ,subs))
        self.attachments = attachments # Attach to instance
        click.echo("Retrieved {} filename(s)".format(len(attachments)))
        
        return attachments


    def log_to_file(self, info, file_name="temporary.json"):
        f = open(file_name, "w")
        json.dump(info, f)
        f.close()


    def grade_file(self):
        # Run grading for a file
        pass
    

    def add_to_sheets(self):
        # Return results to sheets
        pass



# ------------------------------------ #
NO_OF_ASSIGNMENTS = 6
NO_OF_ALLOWED_RESUBS = 2

docs = {
    "course_number": "Specify the course. 1 for Suacode Africa 1, 2 for Suacode Africa 2,etc. Additionally \
        you can specify multiple courses. Eg. --course_number=1,2,3 to pull assignments for course 1, 2 and 3",
    "assignment_number":"Specify the assignment you want to grade.",
    "submission": "Specify whether you're grading first submissions or resubs. Eg. --submission=2",
}
   

@click.command()
@click.option('--submission', '-s', type=click.Choice( list(str(i) for i in range(1, NO_OF_ALLOWED_RESUBS+1)) ), default="1", help=docs["submission"])
@click.option('--course', '-c', required="True", help=docs["course_number"])
@click.option('--assignment', '-a', type=click.Choice( list(str(i) for i in range(1, NO_OF_ASSIGNMENTS+1)) ), required="True", help=docs["assignment_number"])
def run_autograd(course_number, assignment_number, submission):
        a = AutoGrad()
        subs = a.get_submissions_for_assignment(course_number, assignment_number)
        at = a.get_files_for_download(subs)
        a.log_to_file(at)
        

if __name__ == "__main__":
    run_autograd()
        


