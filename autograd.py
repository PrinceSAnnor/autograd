from classroom.modules.Teacher import Teacher
from modules.Drive import Drive
from modules.Records import Records

import os, subprocess, sys, csv, json
from datetime import datetime

# Sheets
import gspread 
from oauth2client.service_account import ServiceAccountCredentials

# Google
from googleapiclient.errors import HttpError


#  VERY NECESSARY!!
# mode = input("\tWhat mode do you want to run, \n \t1. Tesing - Writes resuts to reults.txt file \n \t2. Grading - You know what this does \n")
# if mode:
#     auth()

# when testinG set testing to true
TESTING = True
# you should know what these do, In Short DONT MESS WITH THEM!!!
ADD_TO_SHEETS = True
ADD_TO_CLASSROOM = False

#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
#The sheets part is not much so ill not export is as a module
#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

#For the json file you'll need to share the client email provided with desired sheet file you want to edit
#scope for spreadsheets and for drive
scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive' ]

creds_f = os.getcwd() + '/credentials/SuaCode Africa-f482d6649058.json'
credentials = ServiceAccountCredentials.from_json_keyfile_name(creds_f, scope)

gc = gspread.authorize(credentials)

# create a teacher and drive instance
teacher = Teacher()
drive = Drive()
recorder = Records()



#""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# Download all students names and ids as csv if it doesnt exist
# Probably a mistake to do this here
#"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if not os.path.exists("assets/id-lists"):

    os.makedirs("assets/id-lists")

    print("Downloading Students lists")
    os.system("python classroom/get_students.py")
    print("Done")


#""""""""""""""""""""""""""""""""""
# Grade assignment for each student
# TODO: optimise the process
#"""""""""""""""""""""""""""""""""""
# Real
my_courses = ['SuaCode Africa 1', 'SuaCode Africa 2', 'SuaCode Africa 3'] #TODO: change courses to actual courses

pong_code = {
    'Assignment 1 - Make Pong Interface' : 'pong_1', 
    'Assignment 2 - Move ball' : 'pong_2',
}
# testing
# my_courses = ['SuaCode Africa 3']


# Get dict of course name and course id
courses = teacher.get_all_courses()

for course in my_courses:
    course_name = course
    ass_name = 'Assignment 1 - Make Pong Interface'
    # ass_name = 'Assignment 2 - Move ball'

    # Get course id 
    course_id = courses[course_name] 

    # Get dict of assignment names and assignmnet id
    assignments = teacher.get_all_assignment_ids(courses[course_name])
    # get asignment id

    ass_id = assignments[ass_name]

    #log course details
    recorder.log_no_attachments(course + ' ' + ass_name)
    recorder.log_no_drive_file(course + ' '  +ass_name)
    recorder.log_not_submitted(course + ' ' + ass_name)
    recorder.log_results(course + ' ' + ass_name)

    # open google sheet and add timestamp
    if ADD_TO_SHEETS:
        wks = gc.open(course_name).sheet1
        date = datetime.today().strftime('%Y-%m-%d-%H:%M:%S')
        row = []
        row.append(date)
        wks.append_row(row)

    if TESTING:
        f = open("results.txt", "a+")
        f.write(course_name + "-" + ass_name + "\n\n")
        f.close() 

    print("Grading %s... %s... \n" % (course, ass_name))
    with open('assets/id-lists/%s.csv' % course_name) as csvfile:
        readCSV = csv.reader(csvfile, delimiter=',')
        for row in readCSV:
            student_id = f'{row[1]}'.strip()
            student_name = f'{row[0]}'.strip()

            # Get submissions made by student
            results = teacher.get_student_submissions(course_id, ass_id, student_id)
            submission = results.get('studentSubmissions', [])

            if submission: # if there is a submisison

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
                            for attachment in submission[0]['assignmentSubmission']['attachments']:
                                if attachment.get("driveFile"):

                                    sub_id = submission[0]['id']
                                    file_name = attachment['driveFile']['title']
                                    file_id = attachment['driveFile']['id']

                                    if file_name[-4:] == ".pde":

                                        print("Student: %s" % student_name)

                                        file_path = 'assets/code/%s/%s/%s' % (course_name, ass_name, student_name)
                                        if not os.path.exists(file_path):
                                            os.makedirs(file_path)

                                        os.chdir(file_path)
                                        new_name = str(number) + '-' + file_id + '-' + file_name 
                                        if not os.path.exists(new_name):
                                            print("Downloading assignment file...")
                                            try:
                                                drive.get_file(file_id, file_name) 
                                                os.rename(file_name, new_name)
                                            except HttpError as e:
                                                print("Couldn't download...")
                                                error = json.loads(e.content).get('error')
                                                print(error)
                                            
                                        os.chdir('../../../../../')

                                        if os.path.isfile(file_path + "/" + new_name):
                                            # call processing with filename as argument
                                            print("Grading...")
                                            args = '"' + file_path + '/' + new_name + '"'
                                            processing_cmd = 'processing-java --sketch="' + os.getcwd() + '/' + pong_code[ass_name] + '" --output="' + os.getcwd() + '/' + pong_code[ass_name] + '/buiid"' + ' --force --run ' + args
                                            
                                            # run processing and get result form the command line
                                            comments = subprocess.check_output(processing_cmd, shell=True)
                                            
                                            # getting score and errors from cmdline
                                            decoded = comments.decode("UTF-8")
                                            results = decoded.replace('Finished.', '')

                                            grade = int(results.split()[0])

                                            one = decoded.split('[')
                                            errors = one[1].split(']')
                                            del errors[-1]

                                            #Godisgreat0021
                                            
                                            print("Done Grading, Uploading results...")
                                            

                                            # prepare data and upload to sheets
                                            data = []
                                            data.append(student_name)
                                            data.append(grade)

                                            if number == 0:
                                                data.append("First Submission")
                                            elif number == 1:
                                                data.append("Resubmitted")

                                            for error in errors:
                                                data.append(error)
                                            
                                            # log results
                                            print("Logging results")
                                            recorder.log_results(str(data))
                                            print("Done.")

                                            if TESTING:
                                                f = open("results.txt", "a+")
                                                f.write(str(data) + "\n")
                                                f.close()    
                                                
                                            # Only run if the ADD_TO_SHEETS var is set to true 
                                            if ADD_TO_SHEETS:
                                                print("Uploading results to google sheets")
                                                try:
                                                    wks.append_row(data)
                                                    print("Successful")
                                                except HttpError as e:
                                                    print("Unccessful")
                                                    error = json.loads(e.content).get('error')
                                                    print(error)       
                                            else:
                                                # User not allowed to upload results
                                                print("Not allowed to upload to google sheets")
                                            
                                            # run if ADD_TO_CLASSROOM var is set to true
                                            if ADD_TO_CLASSROOM:
                                                # upload the results
                                                print("Uploading results to classroom")

                                                try: 
                                                    body={ 'assignedGrade': grade, 'draftGrade': grade }
                                                    results = teacher.grade_submissions(course_id, ass_id, sub_id, body)

                                                    # TODO: you can do better than if(results), get the response that was sent and make meaning of it
                                                    if(results):
                                                        print('Successful')
                                                    else:
                                                        print('Unsuccessful')
                                                
                                                except HttpError as e:
                                                    print("Unsuccessful")
                                                    error = json.loads(e.content).get('error')
                                                    print(error)
                                            else:
                                                # User not allowed to upload results
                                                print("Not allowed to post to classroom")

                                            print("Done! \n")

                                            #TODO send errors as emails
                                        else:
                                            # file does not exist
                                            pass
                                    else:
                                        pass
                                        # not a sourcefile so dont grade
                                else:
                                    recorder.log_no_drive_file("there are no gdrive attachments for %s's submission" % student_name)    
                            # End of for loop 
                        else: 
                            # student didnt attach files
                            #TODO: do approriate thing
                            recorder.log_no_attachments('%s didnt attach files' % student_name)
                    else: 
                        # student has resubmitted already
                        print('Student has resubmitted already')
                else: 
                    # submission is not turned in for grading
                    pass
            else:
                recorder.log_not_submitted("No submission for %s" % student_name)
                # theres no submission for that student


# def auth():
#     if mode == '1':
#         TESTING = True
#         ADD_TO_SHEETS = True
#         ADD_TO_CLASSROOM = False
#         print("\tTesting mode activated")
#     elif mode == '2':
#         print("\tSorry but you cant do that atm...")
#         # TESTING = False
#         # sheets = input("\tDo you want to upload resutls to Google sheets? Y/N ")
#         # if sheets == "y":
#         #     ADD_TO_SHEETS = True
#         #     print("\tOkay... I hear you")
#         # elif sheets == 'n':
#         #     ADD_TO_SHEETS = False
#         # else:
#         #     print("\tEnter a right value")

#         # classroom = input("\tDo you want to upload grade to Google classroom? Y/N ")
#         # if classroom == "y":
#         #     ADD_TO_CLASSROOM = False
#         #     print("\tErrmm... Sorry not risking that.")
#         # else:
#         #     ADD_TO_CLASSROOM = False
#     else: 
#         print("\tEnter a right value")
