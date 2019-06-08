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


    def download_files(self, course_number, assignment_number):
        """ Download necessary files to be graded """
        pass

    def get_assignments_for_course(self, course_number, assignment_number):      
        assg_ids = []

        # type cast id
        assignment_number = int(assignment_number)

        # Get dict of course name and course id
        courses = self.teacher.get_all_courses() 

        # get multiple course numbers if given
        if "," in course_number:
            course_number = tuple(int(n.strip()) for n in course_number.split(','))
        else: course_number = tuple(int(course_number))

        # Get course ids for selected courses eg. suacode 1 and 2 
        course_ids = tuple(map(lambda cn: courses[self.course_names[cn-1]], course_number))

        for id in course_ids:      
            # Get dict of assignment names and assignment id
            assignments = self.teacher.get_all_assignment_ids(id)
        
            # Get assignment id for selected assignment to be graded
            assg_id = assignments[ self.assg_names[assignment_number-1] ]
            
            assg_ids.append(assg_id)
            #click.echo(assg_id)
        return assg_ids


    def grade_file(self):
        # Run grading for a file
        pass
    

    def add_to_sheets(self):
        # Return results to sheets
        pass


    def run(self):
        # run
        pass


# ------------------------------------ #

@click.command()
@click.option('--course_number')
@click.option('--assignment_number')
def run_autograd(course_number, assignment_number):
    
    a = AutoGrad()
    a.get_assignments_for_course(course_number, assignment_number)

if __name__ == "__main__":
    run_autograd()
        


