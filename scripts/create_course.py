from classroom.modules.Teacher import Teacher

COURSE_TEMPLATE = {
'name': '',
'section': '',
'descriptionHeading': '',
'description': "",
'room': '',
'ownerId': 'me',
'courseState': 'PROVISIONED'
}

print("[SCRIPTS] Create new course \n")

name = input("Enter course name: ")
description = input("Enter description: ")

COURSE_TEMPLATE['name'] = name
COURSE_TEMPLATE['description'] = description

try:
    teacher = Teacher()
    done = teacher.create_new_course(COURSE_TEMPLATE)
    print("Course created successfully. \n{}".format(done))
except Exception as e:
    print("Unable to create course: ", e)