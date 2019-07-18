# Create all assignments

from modules.Teacher import Teacher

import json

# Source of assignments
FROM = ['SuaCode Africa 1']

# Destination of assignments
TO = ['Coding 2019']

def log_to_file( info, file_name="temporary.json"):
    try:
        f = open(file_name, "w")
        json.dump(info, f)
        f.close()
        return True
    except:
        return False

BODY = {
        "title": "",
        "description": "",
        "materials": "",
        "state": "",
        "dueDate": {},
        "dueTime": {},
        "maxPoints": "",
        "workType": "",
        "assigneeMode": "",
        "submissionModificationMode": "",
    }

due_date = {
            'year': 2019,
            'month': 7,
            'day' : 20,
        }
due_time = {
        "hours": 23,
        "minutes": 59,
        "seconds": 00,
    }
max_points = "20"
state = "DRAFT"     # Possible values, PUBLISHED, DRAFT, DELETED, COURSE_WORK_STATE_UNSPECIFIED
work_type = "ASSIGNMENT" # Possible values COURSE_WORK_TYPE_UNSPECIFIED, ASSIGNMENT, MULTIPLE_CHOICE_QUESTION, SHORT_ANSWER_QUESTION
assignee_mode = "ALL_STUDENTS" # Possible values ASSIGNEE_MODE_UNSPECIFIED, ALL_STUDENTS, INDIVIDUAL_STUDENTS
submission_modification_mode = "MODIFIABLE" # Possible values SUBMISSION_MODIFICATION_MODE_UNSPECIFIED, MODIFIABLE_UNTIL_TURNED_IN, MODIFIABLE


if __name__ == '__main__':
    # Login to Classroom
    teacher = Teacher()
    
    # Get course info from Google Classroom
    course_info = teacher.get_all_courses()
    course_ids_from = list(map(lambda name: course_info.get(name,''), FROM))
    course_ids_to = list(map(lambda name: course_info.get(name,''), TO))
    
    print("FROM:")
    print(course_ids_from)

    print("TO:")
    print(course_ids_to)

    # Get all assignment info from Google Classroom
    assignments_info = list(map(lambda id: teacher.get_all_assignments(id), course_ids_from))
    assignments_info = assignments_info[0].get("courseWork",[])
    log_to_file(assignments_info)
 
    # Get assignment info from json file
    with open("classroom/temporary.json", "r") as f:
        assignments_info = json.load(f)

    for c in assignments_info:
        mats = c.get("materials",[])[0]
        BODY["title"] = mats["driveFile"]["driveFile"]["title"]
        BODY["materials"] = [mats]
        BODY["state"] = state
        BODY["dueDate"] = due_date
        BODY["dueTime"] = due_time
        BODY["maxPoints"] = max_points
        BODY["workType"] = work_type
        BODY["assigneeMode"] = assignee_mode
        BODY["submissionModificationMode"] = submission_modification_mode

        # Create assignments
        for id in course_ids_to:
            print("========")
            print("Creating {} in classroom with id {}".format(BODY["title"], id))          
            print(BODY) 
       
            # teacher.create_assignment(id, BODY)
    
