from modules.Teacher import Teacher

import json


if __name__ == '__main__':
    # Login to Classroom
    teacher = Teacher()

    # valid courses
    my_courses = ['SuaCode Africa 1', 'SuaCode Africa 2', 'SuaCode Africa 3']

    # get courses
    courses = teacher.get_all_courses()
    print(courses)

    # Assisinment doc forma [id, title, url]
    instructions_material = ['1gAJCekLfsulZZ5Jicy5wj1-Z2SVk3zt6y1ZgkFNVnRo','Assignment 4 - Move Paddles','https://drive.google.com/open?id=1gAJCekLfsulZZ5Jicy5wj1-Z2SVk3zt6y1ZgkFNVnRo']

    title = "Assignment 4 - Move Paddles"
    description = ""
    max_points = 20
    materials = [
            {
                "driveFile": {
                    "driveFile": {
                        "id": instructions_material[0],
                        "title": instructions_material[1],
                        "alternateLink": instructions_material[2],
                    },
                    "shareMode": "VIEW"
                },
            }
         ]
    state = "DRAFT"     # Possible values, PUBLISHED, DRAFT, DELETED, COURSE_WORK_STATE_UNSPECIFIED
    due_date = {
            'year': 2019,
            'month': 6,
            'day' : 7,
        }
    due_time = {
            "hours": 23,
            "minutes": 59,
            "seconds": 00,
        }
    work_type = "ASSIGNMENT" # Possible values COURSE_WORK_TYPE_UNSPECIFIED, ASSIGNMENT, MULTIPLE_CHOICE_QUESTION, SHORT_ANSWER_QUESTION
    assignee_mode = "ALL_STUDENTS" # Possible values ASSIGNEE_MODE_UNSPECIFIED, ALL_STUDENTS, INDIVIDUAL_STUDENTS
    submission_modification_mode = "MODIFIABLE" # Possible values SUBMISSION_MODIFICATION_MODE_UNSPECIFIED, MODIFIABLE_UNTIL_TURNED_IN, MODIFIABLE

    body = {
        "title": title,
        "description": description,
        "materials": materials,
        "state": state,
        "dueDate": due_date,
        "dueTime": due_time,
        "maxPoints": max_points,
        "workType": work_type,
        "assigneeMode": assignee_mode,
        "submissionModificationMode": submission_modification_mode,
    }

    for course in my_courses:
        assignment_id = teacher.create_assignment(courses[course], body)

        if assignment_id:
            print(assignment_id)
            print('success')
