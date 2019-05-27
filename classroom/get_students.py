from modules.Teacher import Teacher
import csv

# For functions at the bottom;
import os, os.path
import errno

def get_id_lists():

    if not os.path.exists('assets/students-details/id-lists/'):
        os.makedirs('assets/students-details/id-lists/')

    
    # Return a dict of courses and their ids
    id = teacher.get_all_courses()

    for course in my_courses:
        token = None

        response = teacher.get_students(id[course], None)
        results = response.get('students', [])

        for entry in results:
            path = 'assets/students-details/id-lists/' + course +'.csv'
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
                response = teacher.get_students(id[course], token)
                results = response.get('students', [])

                for entry in results:
                    path = 'assets/students-details/id-lists/' + course +'.csv'
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

def get_emails():

    for course in my_courses:

        with open('assets/students-details/id-lists/%s.csv' % course) as csvfile:
            read_ids = csv.reader(csvfile, delimiter=',')
            for row in read_ids:
                stu_id = f'{row[1]}'.strip()
                fullname = f'{row[0]}'.strip()
                with open('email-lists/%s.csv' % course) as csvfile:
                    read_emails = csv.reader(csvfile, delimiter=',')
                    for row in read_emails: 
                        surname = f'{row[0]}'.strip()
                        firstname = f'{row[1]}'.strip()
                        email = f'{row[2]}'.strip()

                        if (firstname + ' ' + surname) == fullname: 
                            f_path = "assets/students-details/%s.csv" % course 
                            f = open(f_path, "a+" )
                            f.write("%s, %s, %s, %s, %s, \n" % (firstname, surname, fullname, stu_id, email))
                            f.close()

                
                        

if __name__ == '__main__':
    # Login to Classroom
    teacher = Teacher()

    # Download the list of students
    my_courses = ['SuaCode Africa 1', 'SuaCode Africa 2', 'SuaCode Africa 3']

    get_id_lists()

    get_emails()