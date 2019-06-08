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
        


    def get_submissions_for_assignment(self, course_number, assignment_number):      
        """ Returns TURNED_IN submissions from one assignment of specified course/classroom(s) """

        # type cast id
        assignment_number = int(assignment_number)

        # Get dict of course name and course id
        courses = self.teacher.get_all_courses() 

        # get multiple course numbers if given
        if "," in course_number:
            course_number = tuple(int(n.strip()) for n in course_number.split(','))
        else: 
            course_number = tuple(course_number)

        # Get course ids for selected courses eg. suacode 1 and 2 
        course_ids = tuple(map(lambda cn: courses[self.course_names[ int(cn) -1]], course_number))

        for id in course_ids:      
            # Get dict of assignment names and assignment id
            assignments = self.teacher.get_all_assignment_ids(id)
        
            # Get assignment id for selected assignment to be graded
            assg_name = self.assg_names[assignment_number-1]
            assg_id = assignments[ assg_name ]
            
            #click.echo( assg_name +":"+assg_id)

            subs = self.teacher.get_student_submissions(id,assg_id).get('studentSubmissions', [])
            turned_in_subs = list(filter(lambda s: s['state'] == self.TURNED_IN ,subs))
            
            return turned_in_subs


    def get_files_for_download(self, subs):
        
        def getPDE(sub):
            a = sub["assignmentSubmission"]["attachments"]
            for i in a:
                if i["driveFile"]["title"][-4:] == ".png":
                    print(i)
                    return i
     
        attachments = list(map( lambda sub: getPDE(sub) ,subs))
        click.echo(attachments)


    def grade_file(self):
        # Run grading for a file
        pass
    

    def add_to_sheets(self):
        # Return results to sheets
        pass



# ------------------------------------ #

@click.command()
@click.option('--submission', '-s', default="1", help="Specify whether you're grading first submissions or resubs.")
@click.option('--course_number', '-c', required="True", help="Specify the course_number. 1 for Suacode Africa 1, 2 for Suacode Africa 2,etc.")
@click.option('--assignment_number', '-a', type=int, required="True", help="Specify the assignment to be graded eg. 1 for assignment 1.")
def run_autograd(course_number, assignment_number, submission):
        a = AutoGrad()
        subs = a.get_submissions_for_assignment(course_number, assignment_number)
        a.get_files_for_download(subs)

if __name__ == "__main__":
    run_autograd()
        


