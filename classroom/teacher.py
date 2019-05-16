from __future__ import print_function
import pickle, os.path, json
from googleapiclient.errors import HttpError
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request

# If modifying these scopes, delete the file token.pickle.
SCOPES = ['https://www.googleapis.com/auth/classroom.courses', 
'https://www.googleapis.com/auth/classroom.coursework.students'] \


class Teacher(object):
    """ Suacode Teacher baako p3 """
    
    def __init__(self):
        self.service = None
        self.boot()
        self.suacode = None # TODO: This is here for testing, remove later


    def __str__(self):
        pass


    def boot(self):
        """Shows basic usage of the Classroom API.
        Prints the names of the first 10 courses the user has access to.
        """
        creds = None
        # The file token.pickle stores the user's access and refresh tokens, and is
        # created automatically when the authorization flow completes for the first
        # time.
        if os.path.exists('token.pickle'):
            with open('token.pickle', 'rb') as token:
                creds = pickle.load(token)
        # If there are no (valid) credentials available, let the user log in.
        if not creds or not creds.valid:
            if creds and creds.expired and creds.refresh_token:
                creds.refresh(Request())
            else:
                flow = InstalledAppFlow.from_client_secrets_file(
                    'credentials.json', SCOPES)
                creds = flow.run_local_server()
            # Save the credentials for the next run
            with open('token.pickle', 'wb') as token:
                pickle.dump(creds, token)

        # Store on obj     
        self.service = build('classroom', 'v1', credentials=creds)


    def get_all_courses(self):
        # Call the Classroom API
        results = self.service.courses().list(pageSize=10).execute()
        courses = results.get('courses', [])

        if not courses:
            print('No courses found.')
        else:
            print('Courses:')
            for course in courses:
                print(course['name'])


    def get_course_details(self, course_id):
        # course_id = '28433114707' # Suacode Cohort 1 ID
        try:
            course = self.service.courses().get(id=course_id).execute()
            s = u'Course "{0}" found.'.format(course.get('name'))
            # print(s)
        except HttpError as e:
            error = json.loads(e.content).get('error')
            if(error.get('code') == 404):
                s = u'Course with ID "{0}" not found.'.format(course_id)
                print(s)
            else:
                print('Error during retrieving ... ')
        
        # TODO: the following line is for testing, remove later
        self.suacode = course  

        return course


    def create_alias_for_course(self, course_id, alias):
        # course_id = '123456'
        # alias = 'p:bio10p2'
        
        course_alias = {
            'alias': alias
        }
        try:
            course_alias = self.service.courses().aliases().create(
                courseId=course_id,
                body=course_alias).execute()
            print('Alias successfully created')
        except HttpError as e:
            error = json.loads(e.content).get('error')
            if(error.get('code') == 409):
                s = u'Alias "{0}" is already in use.'.format(course_alias.get('alias'))
                print(s)
            else:
                print('Could not add alias')


    def get_student_submissions_for_course(self, course_id, coursework_id):
        try:
            studentSubmissions = self.service.courses.courseWork.studentSubmissions().list( \
            courseId=course_id, courseWorkId=coursework_id).execute()
            return studentSubmissions

            # print(studentSubmissions)
        except HttpError as e:
            error = json.loads(e.content).get('error')
            return error


    def get_student_submissions(self, course_id):
        try:
            studentSubmissions = self.service.courses.courseWork.studentSubmissions().get(courseId=course_id).execute()
            return studentSubmissions
        except HttpError as e:
            error = json.loads(e.content).get('error')
            return error


    def create_new_course(self, course):
        """
        Create a new course 
        
        Pass in a dict with the following params
        {
            'name': '10th Grade Biology',
            'section': 'Period 2',
            'descriptionHeading': 'Welcome to 10th Grade Biology',
            'description': "We'll be learning about about the structure of living
                        creatures from a combination of textbooks, guest
                        lectures, and lab work. Expect to be excited!",
            'room': '301',
            'ownerId': 'me',
            'courseState': 'PROVISIONED'
        }
        """
        course = self.service.courses().create(body=course).execute()
        s = u'Course created: {0} ({1})'.format(course.get('name'), course.get('id'))
        # print(s)
        return course.get('id')


    def create_assignment(self, course_id, course_work):
        course_work = self.service.courses().courseWork().create(courseId=course_id, body=course_work).execute()
        # print('Assignment created with ID {0}'.format(course_work.get('id')))
        return course_work.get('id')
    

    def get_all_assignments(self, course_id):
        try:
            results = self.service.courses().courseWork().list(courseId=course_id).execute()
            return results
        except HttpError as e:
            error = json.loads(e.content).get('error')
            return error 


    def get_assignment(self, course_id, assignment_id):
        try:
            results = self.service.courses().courseWork().get(id=assignment_id, courseId=course_id).execute()
            return results
        except HttpError as e:
            error = json.loads(e.content).get('error')
            return error 

    def get_all_students(self):
        pass


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

    f = open('students.json', 'w+')
    f.write(json.dumps(all))
    f.close()

    # Grade the assignment


 
  
    