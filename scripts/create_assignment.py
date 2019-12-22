# Create all assignments

from classroom.modules.Teacher import Teacher
import json

# Constants
FROM = 'SuaCode Africa 1' # Assignment template
TO = []
YES = "y"
NO = "n"
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
            'month': 12,
            'day' : 24,
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
response = YES

# Functions
def save_json( info, file_name="temporary.json"):
    try:
        with open(os.path.join(os.getcwd(),file_name), "w") as f:
            json.dump(info, f)
            return True
    except:
        return False

def load_json(file_path):
    with open(file_path, "r") as f:
        return json.load(f)

def print_list_names(courses={}):
    names = list(courses.keys())
    print("Which course are you creating assignments for? ")
    for a,b in enumerate(names):
        output = "{}: {}".format(a,b)
        print(output)
    
def test_get_all_courses():
    return load_json('courses.json')

def get_course_name(index, courses={}):
    names = list(courses.keys())
    return names[int(index)]

def get_course_id(index, courses={}):
    ids = list(courses.values())
    return ids[int(index)]

teacher = Teacher()
courses_info = teacher.get_all_courses() 
save_json(courses_info) # test method
# courses_info = test_get_all_courses() # test method

while response != NO:
    print_list_names(courses_info)
    index = input("Enter index of course: ")
    chosen = get_course_name(index, courses_info) 
    print("You chose {}\n".format(chosen))
    TO.append(chosen)
    response = input("Do you want to enter another course name? ({} for yes, {} for no) :".format(YES, NO))

print("Creating assignments for {} using template from {} : ",TO, FROM)

FROM_id = courses_info.get(FROM, '')
assignments_info = teacher.get_all_assignments(FROM_id).get("courseWork", [])
TO_ids = list(map(lambda name: courses_info.get(name) ,TO)) 

for assignment in assignments_info:
    mats = assignment.get("materials",[])[0]
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
    for id in TO_ids:
        print("========")
        print("Creating {} in classroom with id {}".format(BODY["title"], id))          
        print(BODY) 
        # teacher.create_assignment(id, BODY)