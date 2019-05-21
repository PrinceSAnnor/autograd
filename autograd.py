from classroom.modules.Teacher import Teacher
from drive.modules.Drive import Drive

import os, subprocess, sys

# create a teacher and drive instance
teacher = Teacher()
drive = Drive()

# TODO: 
"""
Get submission if there is one
Grade
Return results

Autograd run Every night***/Just Twice***
For each course
It gets all the students ids
For each id
if there is a submission for the week's assignment
Calls processing to grade.
Processing prints results to console
Python reads results from console
Uploads results

Handle errors better

"""

my_courses = ['Test Class'] #TODO: change courses to actual courses

# For Testing
course_name = 'Test Class'
ass_name = 'Assignment 1'

# Get course id
courses = teacher.get_all_courses()
course_id = courses[course_name]

# Get Assignmnet id
assignments = teacher.get_all_assignment_ids(courses[course_name])
ass_id = assignments[ass_name]

# Get profiles of all students that take the course
#TODO: find a better way

students_arr = []
response = teacher.get_students(course_id, None)
students = response.get('students', [])

for student in students:
    students_arr.append(student['profile']) # append each studetns profile to the students array

if response.get('nextPageToken'):
    token = response['nextPageToken']
else:
    token = None

while True:
    if token:
        response = teacher.get_students(course_id, token)
        students = response.get('students', [])

        for student in students:
            students_arr.append(student['profile']) # append each studetns profile to the students array

        if response.get('nextPageToken'):
            token = response['nextPageToken']
        else:
            token = None
    else:
        break


# Grade assignment for each student
# TODO: optimise the process
for student in students_arr:
    # Get submissions made by student
    results = teacher.get_student_submissions(course_id, ass_id, student['id'])
    submission = results.get('studentSubmissions', [])

    # check if submission has attachments
    if submission[0]['assignmentSubmission'].get('attachments'):
        # TODO: check if the student has TURNED IN the assignment before grading
        # TODO: check if student has resubnmited already, they're only allowed to resubmit once

        # download file
        sub_id = submission[0]['id']
        file_name = submission[0]['assignmentSubmission']['attachments'][0]['driveFile']['title']
        file_id = submission[0]['assignmentSubmission']['attachments'][0]['driveFile']['id']

        drive.get_file(file_id, file_name) #FIXME downloads code file to the root dir, change 

        # call processing with filename as argument
        args = file_name
        prosessing_cmd = 'processing-java --sketch="' + os.getcwd() + '/pong_1" --output="' + os.getcwd() + '/pong_1/build"' + ' --force --run ' + args
        
        # run processing and get result form the command line
        result = subprocess.check_output(prosessing_cmd, shell=True)

        # getting score from cmdline
        string_form = result.decode("UTF-8")
        grade_str = string_form.replace('Finished.', '')

        # convert grade_str to grade_int
        grade = int(grade_str)

        # uncomment the part that uploads the results f you need it
        """
        # upload the results
        body={ 'assignedGrade': grade, 'draftGrade': grade }
        results = teacher.grade_submissions(course_id, ass_id, sub_id, body)

        # TODO: you can do better than if(results), get the response that was sent and make meaning of it
        if(results):
            print('Successful')
        else:
            print('unsuccessful')
        """
        # TODO: Get Errors/Comments and send them as well
    else: 
        pass
        # student didnt attach files
        #TODO: do approriate thing
