from modules.AutoGrad import AutoGrad
import click

# ------------------------------------ #

NO_OF_ASSIGNMENTS = 6
NO_OF_ALLOWED_RESUBS = 5
NIL = 'nil'

ALLOWED_ASSIGNMENTS = list(str(i) for i in range(1, NO_OF_ASSIGNMENTS+1))
ALLOWED_RESUBS = list(str(i) for i in range(1, NO_OF_ALLOWED_RESUBS+1))

docs = {
    "deploy":"Run and upload",
    "course": "Specify the course. 1 for SuaCode Africa 1, 2 for SuaCode Africa 2,etc. Additionally \
        you can specify multiple courses. Eg. --course_number=1,2,3 to pull assignments for course 1, 2 and 3",
    "assignment":"Specify the assignment you want to grade.",
    "submission": "Specify whether you're grading first submissions or resubs. Eg. --submission=2",
    "file": "Specify the path of file to be graded offline Eg. --file=pong_1/assignment_1/assignment_1.pde"
}
   
@click.group(invoke_without_command=True)
@click.option('--file', '-f', help=docs["file"])
@click.option('--submission', '-s', type=click.Choice( ALLOWED_RESUBS ), default="1", help=docs["submission"])
@click.option('--course', '-c', help=docs["course"])
@click.option('--assignment', '-a', type=click.Choice( ALLOWED_ASSIGNMENTS ),  help=docs["assignment"])
@click.pass_context
def cli(context, course, assignment, submission, file):
    context.ensure_object(dict) #

    # Attach the inputs to context object
    context.obj['course'] = course or NIL
    context.obj['assignment'] = assignment or NIL
    context.obj['submission'] = submission or NIL
    # context.obj['file'] = file or NIL


    if context.invoked_subcommand is None:
        # If we don't add 'deploy' argument it means we want to do tests
        click.echo("[TEST] Running AutoGrad..")
        
        # Init
        a = AutoGrad()

        # Option 1 - Testing fully automated process
        # a.retrieve(course, assignment, submission) # Get files, download
        # results = a.grade_files(assignment, course, submission) # Results of grading. Stored in results.json also
        # added = a.add_to_classroom(course, assignment, results, return_grade=True) # Set return_grade = False if you want only draftGrade
        # if added: a.send_mail(results=results)
        # else: click.echo("could not add to classroom")
        
        # Option 2 - Manual grade from local files and add to classroom (without results)
        # results = a.grade_files(assignment, course, submission)
        # status = a.add_to_classroom(course, assignment, results, return_grade=True)

        # Option 3 - Manual Add to Classroom from graded results
        # import os
        # IMPORTANT: Do not delete your logs folder just in case
        # dir = os.path.join('logs','2019-06-19-16-58-46') # Replace the second argument with the folder name of the results you want to submit
        # results = a.attach_ids(dir)
        # status = a.add_to_classroom(course, assignment, results, return_grade=True)

        # Option 4 - Manual mailing
        # import json
        # IMPORTANT: Do not delete your logs folder just in case
        # dir = os.path.join('logs','2019-06-19-16-22-13', 'results.json')
        # f = open(dir,'r')
        # res = json.load(f)
        # status = a.send_mail(res)
        # print(status)

        # Option - 5 Check how many turned in
        # a.boot() # Connect to Google APIs. This is not needed when testing  
        # subs =  a.get_submissions_for_assignment(course, assignment, submission) # Get turned in submissions
        # at = a.get_files_for_download(subs) # Get the .pde file attachments
        # a.log_to_file(at,"turned_in.json")
       

@cli.command()
@click.pass_context
def check(context):
    check_required = NIL not in list(context.obj.values())
   
    if check_required: 
        # Get command line options
        course = context.obj['course']
        assignment = context.obj['assignment']
        submission = context.obj['submission']
    
        click.echo("[TEST] Running AutoGrad..")
        import os

        a = AutoGrad() # Init
        a.boot() # Connect to Google APIs. This is not needed when testing  
        subs =  a.get_submissions_for_assignment(course, assignment, submission) # Get turned in submissions
        at = a.get_files_for_download(subs) # Get the .pde file attachments
        name = "turned_in_c%s_a%s_s%s.json" % (course,assignment,submission)  
        fn = os.path.join(a.BASE_DIR, 'logs' ,name)
        a.log_to_file(at,fn)
        click.echo("Currently turned in submissions logged to logs/turned_in_{}_{}_{}.json".format(course,assignment,submission))
    else:
        click.echo("Insufficient options. Exiting.. Try --help for more info")


@cli.command()
@click.pass_context
def deploy(context):
    """Run complete process"""
    check_required = NIL not in list(context.obj.values())
   
    if check_required: 
        # Get command line options
        course = context.obj['course']
        assignment = context.obj['assignment']
        submission = context.obj['submission']
    
        click.echo("[DEPLOY] Running AutoGrad..")
        
        # Start
        a = AutoGrad()

        # Download, grade, submit and mail. Sheets coming soon
        a.deploy(course, assignment, submission, return_grade=True)

    else:
        click.echo("Insufficient options. Exiting.. Try --help for more info")


if __name__ == "__main__":
    cli(obj={})
        


