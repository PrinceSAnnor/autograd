from modules.Teacher import Teacher

import json
import csv


if __name__ == '__main__':
    # Login to Classroom
    teacher = Teacher()

    my_courses = ['Test Class']

    id = teacher.get_all_courses()

    for course in my_courses:
        course_id = id[course]

        ass_ids = teacher.get_all_assignment_ids(course_id)
        ass_id = ass_ids['Assignment 1']

        path = "../assets/results/" + course + "/Assignment 1/results.csv"
        with open(path) as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            line_count = 0

            for row in csv_reader:

                user_id = f'{row[1]}'

                sub_id = teacher.get_student_submission_id(course_id, ass_id, user_id)
                grade = f'{row[3]}'

                body={ 'assignedGrade': grade, 'draftGrade': grade }
                results = teacher.grade_submissions(course_id, ass_id, sub_id, body)

                if(results):
                    print('Successful')
                else:
                    print('unsuccessful')
        