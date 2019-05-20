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
    instructions_material = ['1uNwWfBI9-JTlcmh4OZ8W9s7xPc9EuoupEIx6inne9iQ','Assignment 1 - Make Pong Interface','https://drive.google.com/open?id=1uNwWfBI9-JTlcmh4OZ8W9s7xPc9EuoupEIx6inne9iQ']
    # reading_material = ['1unJWDGheh0vIjFXSvWHdjAl1T-C13PWvyDHL8CHKkAM','Basic concepts in programming','https://drive.google.com/open?id=1unJWDGheh0vIjFXSvWHdjAl1T-C13PWvyDHL8CHKkAM']

    title = "Assignment 1 - Make Pong Intergface"
    description = "Testing"
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
                # "driveFile" : {
                #     "driveFile": {
                #         "id": instructions_material[0],
                #         "title": instructions_material[1],
                #         "alternateLink": instructions_material[2],
                #     },
                #     "shareMode": "VIEW"
                # },
                # "link": {
                #     "url":'https://drive.google.com/open?id=1unJWDGheh0vIjFXSvWHdjAl1T-C13PWvyDHL8CHKkAM',
                #     "title": "boom"
                # }
            }
         ]
    state = "PUBLISHED"     # Possible values, PUBLISHED, DRAFT, DELETED, COURSE_WORK_STATE_UNSPECIFIED
    due_date = {
            'year': 2019,
            'month': 5,
            'day' : 20,
        }
    due_time = {
            "hours": 11,
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

    assignment_id = teacher.create_assignment(courses['Test Class'], body)

    if assignment_id:
        print(assignment_id)
        print('success')





















    """ 
    During grading we need the following:
    the courseId, the courseWorkId (assignment_id), id of each 
    student's studentSubmission object, and an dict sending the grades
    ie. { 'assignedGrade': 90, 'draftGrade': 80 }

    """
    
    # Mini docs using Teacher

    # Get all assignments
    # all = teacher.get_all_assignments(course_id)

    # Get this assignment from this class and grade
    # assignment = teacher.get_assignment(course_id, assignment_id)

    # Get 

    # Get all student submissions for particular assignment 
    # Takes an extra user_id parameter to get for a particular student

    # USE first OR second expression
    # subs = teacher.get_student_submissions(course_id, assignment_id)
    #       OR
    # subs = teacher.get_student_submissions(course_id, assignment_id, user_id)
    
    # Grade a student: draftGrade is a temporary grade visible to teachers;
    # assignedGrade is the final one

    # submission = { 'assignedGrade': 10, 'draftGrade': 10 }

    # Response in `graded` contains an instance of the new submission
    # graded = teacher.grade_submissions(course_id, assignment_id, \
    #     student_submission_id, submission)