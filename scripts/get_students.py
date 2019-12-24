from classroom.modules.Teacher import Teacher
import csv

# For functions at the bottom;
import os, os.path
import errno

def print_list_names(courses={}):
    names = list(courses.keys())
    print("Which course are you creating assignments for? ")
    for a,b in enumerate(names):
        output = "{}: {}".format(a,b)
        print(output)

def get_course_name(index, courses={}):
    names = list(courses.keys())
    return names[int(index)]

def get_course_id(index, courses={}):
    ids = list(courses.values())
    return ids[int(index)]

def get_id_lists(my_courses):

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

def get_emails(my_courses):

    for course in my_courses:

        with open('assets/students-details/id-lists/%s.csv' % course) as csvfile:
            read_ids = csv.reader(csvfile, delimiter=',')
            for row in read_ids:
                stu_id = f'{row[1]}'.strip()
                fullname = f'{row[0]}'.strip()
                with open('assets/email-lists/%s.csv' % course) as csvfile:
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
    courses_info = teacher.get_all_courses() 
    courses = []
    YES = "y"
    NO = "n"
    response = YES

    while response != NO:
        print_list_names(courses_info)
        index = input("Enter index of course: ")
        chosen = get_course_name(index, courses_info) 
        print("You chose {}\n".format(chosen))
        
        courses.append(chosen)
        response = input("Do you want to enter another course name? ({} for yes, {} for no) :".format(YES, NO))

    # Download the list of students
    get_id_lists(courses)
    get_emails(courses)