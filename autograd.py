#main autograd script
from classroom.modules.Teacher import Teacher
from modules.Drive import Drive
from modules.Mail import Mail
from modules.Sheets import Sheets

import os, subprocess, sys, csv, json
from datetime import datetime
from googleapiclient.errors import HttpError


def add_to_sheets():
    print("Uploading results to google sheets")
    try:
        wks.append_row(data)
        print("Successful")
    except HttpError as e:
        print("Unccessful")
        error = json.loads(e.content).get('error')
        print(error)

def send_mail():
    # upload the results
    print("Sending mail...")
    try: 
        mailer.send_message(student_email, "Assignment 2 results", message)
        print("Successful")
    except HttpError as e:
        print("Unsuccessful")
        error = json.loads(e.content).get('error')
        print(error)
        
def add_to_classroom():
    # upload the results
    print("Uploading results to classroom")

    try: 
        body={ 'assignedGrade': grade, 'draftGrade': grade }
        results = teacher.grade_submissions(course_id, ass_id, sub_id, body)

        # TODO: you can do better than if(results), get the response that was sent and make meaning of it
        if(results):
            # returned = teacher.return_submission(course_id, ass_id, sub_id)
            # if returned:
            print("Successful")
        else:
            print('Unsuccessful')
    
    except HttpError as e:
        print("Unsuccessful")
        error = json.loads(e.content).get('error')
        print(error)

def switch_group(argument):
    switcher = {
        '1': "SuaCode Africa 1",
        '2': "SuaCode Africa 2",
        '3': "SuaCode Africa 3",
    }
    print (switcher.get(argument, "Invalid course"))
    return switcher.get(argument, "Invalid course")


def switch_ass(argument):
    switcher = {
        '1': 'Assignment 1 - Make Pong Interface',
        '2': 'Assignment 2 - Move ball',
        '3': 'Assignment 3 - Bounce Ball',
        '4': 'Assignment 4 - Move Paddles',
        '5': 'Assignment 5 - Add Extra Ball',
        '6': 'Assignment 6 - Add More Balls'
    }
    print (switcher.get(argument, "Invalid assignment"))
    return switcher.get(argument, "Invalid assignment")


def switch_submission(argument):
    switcher = {
        'first': 0,
        'second': 1
    }
    print (switcher.get(argument, "Invalid assignment"))
    return switcher.get(argument, "Invalid assignment")

if __name__ == "__main__":

    # Get the courses to grade
    my_courses =  [] 

    # get cli args
    my_courses.append(switch_group(sys.argv[1]))
    ass_name = switch_ass(sys.argv[2])
    sub_number = switch_submission(sys.argv[3])

    #  VERY NECESSARY!!
    date = datetime.today().strftime('%Y-%m-%d-%H:%M:%S')

    # when testinG set testing to true
    TESTING = True

    # you should know what these do, In Short DONT MESS WITH THEM!!!
    ADD_TO_SHEETS = True
    ADD_TO_CLASSROOM = True
    SEND_MAIL = True

    """
    Download all students names and ids as csv if it doesnt exist
    Probably a mistake to do this here
    """
    if not os.path.exists("assets/students-details"):

        os.makedirs("assets/students-details")

        print("Downloading and setting up students details...")
        os.system("python classroom/get_students.py")
        print("Done")

    """
    Things that need to be done
    """
    #map pong code to corres ponding assignment
    pong_code = {
        'Assignment 1 - Make Pong Interface' : 'pong_1', 
        'Assignment 2 - Move ball' : 'pong_2',
        'Assignment 3 - Bounce Ball' : 'pong_3',
        'Assignment 4 - Move Paddles': 'pong_4',
        'Assignment 5 - Add Extra Ball' : 'pong_5',
        'Assignment 6 - Add More Balls' : 'pong_6'
    }

    # create a required instances
    teacher = Teacher()
    drive = Drive()
    mailer = Mail()
    sheet = Sheets()


    # Get dict of course name and course id
    courses = teacher.get_all_courses()


    """
    Grade assignment for each student
    TODO: optimise the process
    """

    for course in my_courses:
        course_name = course

        # Get course id 
        course_id = courses[course_name] 

        # Get dict of assignment names and assignmnet id
        assignments = teacher.get_all_assignment_ids(courses[course_name])
        # get asignment id

        ass_id = assignments[ass_name]

        # open google sheet and add timestamp
        if ADD_TO_SHEETS:
            wks = sheet.get_worksheet(course)
            row = []
            row.append(date)
            wks.append_row(row)

        if TESTING:
            f = open("results.txt", "a+")
            f.write(course_name + "-" + ass_name + "\n\n")
            f.close() 

        print("Grading %s... %s... \n" % (course, ass_name))
        with open('assets/students-details/%s.csv' % course_name) as csvfile:
            readCSV = csv.reader(csvfile, delimiter=',')
            for row in readCSV:
                student_firstname = f'{row[0]}'.strip()
                student_lastname = f'{row[1]}'.strip()
                student_name = f'{row[2]}'.strip()
                student_id = f'{row[3]}'.strip()
                student_email = f'{row[4]}'.strip()

                # Get submissions made by student
                results = teacher.get_student_submissions(course_id, ass_id, student_id)
                submission = results.get('studentSubmissions', [])

                if submission: # if there is a submisison

                    if submission[0]['state'] == "TURNED_IN": # grade only turned in assignments
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
                        
                        print(number)
                        
                        if number == sub_number:
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

                                            # flag for if file exixts
                                            should_grade = False

                                            if not os.path.exists(new_name):
                                                should_grade = True
                                                print("Downloading assignment file...")
                                                try:
                                                    drive.get_file(file_id, file_name) 
                                                    os.rename(file_name, new_name)
                                                except HttpError as e:
                                                    print("Couldn't download...")
                                                    error = json.loads(e.content).get('error')
                                                    print(error)
                                            os.chdir('../../../../../')

                                            if should_grade:
                                                if os.path.isfile(file_path + "/" + new_name):
                                                    # call processing with filename as argument
                                                    print("Grading...")
                                                    args = '"' + file_path + '/' + new_name + '"'
                                                    processing_cmd = 'processing-java --sketch="' + os.getcwd() + '/' + pong_code[ass_name] + '" --output="' + os.getcwd() + '/' + pong_code[ass_name] + '/build"' + ' --force --run ' + args
                                                    
                                                    # run processing and get result form the command line
                                                    comments = subprocess.check_output(processing_cmd, shell=True)
                                                    
                                                    # getting score and errors from cmdline
                                                    decoded = comments.decode("UTF-8")
                                                    results = decoded.replace('Finished.', '')

                                                    grade = int(results.split()[0])

                                                    one = decoded.split('[')
                                                    errors = one[1].split(']')
                                                    del errors[-1]
                                                    
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
                                                    
                                                    data.append(new_name)

                                                    #prepare mail message
                                                    mail = []
                                                    mail.append("Hi %s,\n\nGood job!\nYou can can check your grade now.\nSee below the things you missed. You can fix them and resubmit only one more time for a better grade by the deadline posted on the classroom page.\nAsk any questions if they aren’t clear. \n\nPlease correct the following mistakes \n\n" % student_firstname)
                                                        
                                                    errs = " ".join(errors)
                                                    errs1 = errs.split(',')
                                                    for err in errs1:
                                                        mail.append(err + '\n')
                                                    
                                                    message = ''.join(mail)
                                                    data.append(message) 
                                            
                                                    # log results
                                                    print("Logging results")
                                                    # recorder.log_results(str(data))
                                                    print("Done.")

                                                    if TESTING:
                                                        f = open("results.txt", "a+")
                                                        f.write(str(data) + "\n")
                                                        f.close()  

                                                    if SEND_MAIL:
                                                        send_mail()
                                                    else:
                                                        # User not allowed to upload results
                                                        print("Not allowed to send mail")  
                                                        
                                                    # Only run if the ADD_TO_SHEETS var is set to true 
                                                    if ADD_TO_SHEETS:
                                                        add_to_sheets()       
                                                    else:
                                                        # User not allowed to upload results
                                                        print("Not allowed to upload to google sheets")
                                                    
                                                    # run if ADD_TO_CLASSROOM var is set to true
                                                    if ADD_TO_CLASSROOM:
                                                        add_to_classroom()
                                                    else:
                                                        # User not allowed to upload results
                                                        print("Not allowed to post to classroom")

                                                    print("Done! \n")
                                                else:
                                                    # file does not exist
                                                    pass
                                            else:
                                                print("Graded file already %s" % new_name)
                                                # end for when file exists
                                        else:
                                            pass
                                            # not a sourcefile so dont grade
                                    else:
                                        pass
                                # End of for loop 
                            else: 
                                # student didnt attach files
                               pass
                        else: 
                            # student has resubmitted already
                            pass
                    else: 
                        # submission is not turned in for grading
                        pass
                else:
                    pass                    
                    # theres no submission for that student
