from modules.Teacher import Teacher

import json


if __name__ == '__main__':
    # Login to Classroom
    teacher = Teacher()
    print('Teacher is in the building')

    course_id = '28433114707' # '36751632090'
    assignment_id = '36751794254'

    # Get all assignments
    all = teacher.get_all_assignments(course_id)

    # Get this assignment from this class and grade
    # assignment = teacher.get_assignment(course_id, assignment_id)

    # Sorts the assignments by IDs. the recently created in this course has a larger value.
    asg_ids = []
    for asg in all['courseWork']:
        if asg['id'][:8] == course_id[:8]:
            asg_ids.append(asg['id'][8:])
    print(sorted(asg_ids))


    # Grade the assignment


 
  
    