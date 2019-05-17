from modules.Teacher import Teacher

import json


if __name__ == '__main__':
    # Login to Classroom
    teacher = Teacher()
    print('Teacher is in the building')
    
    # Mini docs using Teacher

    # Get all assignments
    # all = teacher.get_all_assignments(course_id)

    # Get this assignment from this class and grade
    # assignment = teacher.get_assignment(course_id, assignment_id)

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
    

    
 
    

 
  
    