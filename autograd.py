from classroom.modules.Teacher import Teacher
from drive.modules.Drive import Drive

import os, subprocess, sys, csv

import gspread 
from oauth2client.service_account import ServiceAccountCredentials



"""
The sheets part is not much so ill not export is as a module
"""
#For the json file you'll need to share the client email provided with desired sheet file you want to edit
#scope for spreadsheets and for drive
scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive' ]

creds_f = os.getcwd() + '/credentials/spreadsheet-example-240602-3df61217e12e.json'
credentials = ServiceAccountCredentials.from_json_keyfile_name(creds_f, scope)

gc = gspread.authorize(credentials)

# open google sheet
wks = gc.open('SuaCode Test').sheet1




# create a teacher and drive instance
teacher = Teacher()
drive = Drive()

my_courses = ['Test Class', 'SuaCode Africa 1', 'SuaCode Africa 2', 'SuaCode Africa 3', 'Test Class'] #TODO: change courses to actual courses

# For Testing
course_name = 'SuaCode Africa 1'
ass_name = 'Assignment 1 - Make Pong Interface'
# ass_name = 'Assignment 1'

# Get dict of course name and course id
courses = teacher.get_all_courses()
# Get course id 
course_id = courses[course_name] 

# Get dict of assignment names and assignmnet id
assignments = teacher.get_all_assignment_ids(courses[course_name])
ass_id = assignments[ass_name]

# Download all students names and ids as csv if it doesnt exist
# Probably a mistake to do this here
if not os.path.exists('assets/id-lists'):
    os.makedirs('assets/id-lists')

    for course in my_courses:
        token = None

        response = teacher.get_students(courses[course], None)
        results = response.get('students', [])

        for entry in results:
            path = '/assets/id-lists/' + course +'.csv'
            f = open(path, 'a+', encoding='utf-8')
            stu_name = entry['profile']['name']['fullName']
            stu_id = entry['profile']['id']

            f.write('%s , %s \n' % (stu_name, stu_id))
            f.close()

        if response.get('nextPageToken'):
            token = response['nextPageToken']
        else:
            token = None

        while True:
            if token:
                response = teacher.get_students(courses[course], token)
                results = response.get('students', [])

                for entry in results:
                    path = '/assets/id-lists/' + course +'.csv'
                    stu_name = entry['profile']['name']['fullName'] #Somenes name is arabic
                    stu_id = entry['profile']['id']

                    f = open(path, 'a+', encoding='utf-8')
                    f.write('%s , %s \n' % (stu_name, stu_id))
                    f.close()
                if response.get('nextPageToken'):
                    token = response['nextPageToken']
                else:
                    token = None
            else:
                break






# Grade assignment for each student
# TODO: optimise the process

with open('/assets/id-lists/%s.csv' % course_name) as csvfile:
    readCSV = csv.reader(csvfile, delimiter=',')
    for row in readCSV:
        student_id = f'{row[1]}'
        stu_name = f'{row[0]}'
        student_name = stu_name.strip()
        # Get submissions made by student
        results = teacher.get_student_submissions(course_id, ass_id, student_id)
        submission = results.get('studentSubmissions', [])

        if submission[0]['state'] == 'TURNED_IN': # grade only turned in assignments
            # check if student has resubnmited already, they're only allowed to resubmit once
            submission_history = submission[0]['submissionHistory']
            
            states = []
            for history in submission_history:
                if history.get('stateHistory'):
                    try:
                        results = history.get('stateHistory')
                        states.append(results['state'])
                    except TypeError:
                        print(history)
                        raise
                else:
                    pass
                    # student doesnt have a stateHistory which is weird
            number = states.count('RETURNED')
            
            if number < 2:
                # check if submission has attachments
                if submission[0]['assignmentSubmission'].get('attachments'):                    
                    
                    # download the .pde file 
                    sub_id = submission[0]['id']
                    file_name = submission[0]['assignmentSubmission']['attachments'][0]['driveFile']['title']
                    file_id = submission[0]['assignmentSubmission']['attachments'][0]['driveFile']['id']

                    if '.pde' in file_name:
                        # print(student_name, file_name)
                        file_path = 'assets/code/%s/%s' % (course_name, student_name)
                        if not os.path.exists(file_path):
                            os.makedirs(file_path)

                        os.chdir(file_path)
                        new_name = str(number) + '-' + file_id + '-' + file_name 
                        if not os.path.exists(new_name):
                            drive.get_file(file_id, file_name) 
                            os.rename(file_name, new_name)
                        os.chdir('../../../../')

                        # # call processing with filename as argument
                        args = '"' + file_path + '/' + new_name + '"'
                        prosessing_cmd = 'processing-java --sketch="' + os.getcwd() + '/pong_1" --output="' + os.getcwd() + '/pong_1/build"' + ' --force --run ' + args
                        
                        # run processing and get result form the command line
                        comments = subprocess.check_output(prosessing_cmd, shell=True)

                        # getting score from cmdline
                        # decoded = comments.decode("UTF-8")
                        # results = decoded.replace('Finished.', '')

                        # grade = int(results.split()[0])
                        # one = results.split('[')
                        # two = one[1].split(']')
                        # convert grade_str to grade_int
                        # grade = int(grade_str)
                        # print(type(grade), type(two))
                        # print(grade, two)

                        # send grade to sheets
                        #wks.append_row([grade])

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
                        # we need only source files
                else: 
                    # student didnt attach files
                    #TODO: do approriate thing
                    print('%s didnt attach files' % student_name)
            else: 
                # student has resubmitted already
                print('Student has resubmitted already')
