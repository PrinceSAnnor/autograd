from modules.Teacher import Teacher

# For functions at the bottom;
import os, os.path
import errno


if __name__ == '__main__':
    # Login to Classroom
    teacher = Teacher()

    # Download the list of students
    my_courses = ['SuaCode Africa 1', 'SuaCode Africa 2', 'SuaCode Africa 3']

    # Return a dict of courses and their ids
    id = teacher.get_all_courses()

    for course in my_courses:
        token = None

        response = teacher.get_students(id[course], None)
        results = response.get('students', [])

        for entry in results:
            path = '../assets/id-lists/' + course +'.csv'
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
                    path = '../assets/id-lists/' + course +'.csv'
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