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
    "submission": "Specify whether you're grading first submissions or resubs. Eg. --submission=2"
}
   
@click.group()  #(invoke_without_command=True)
@click.option('--submission', '-s', type=click.Choice( ALLOWED_RESUBS ), default="1", help=docs["submission"])
@click.option('--course', '-c', help=docs["course"])
@click.option('--assignment', '-a', type=click.Choice( ALLOWED_ASSIGNMENTS ),  help=docs["assignment"])
@click.pass_context
def cli(context, course, assignment, submission):
    context.ensure_object(dict) #

    # Attach the inputs to context object
    context.obj['course'] = course or NIL
    context.obj['assignment'] = assignment or NIL
    context.obj['submission'] = submission or NIL
    # context.obj['file'] = file or NIL

    # if context.invoked_subcommand is None:
    #     # If we don't add 'deploy' argument it means we want to do tests
    #     click.echo("[TEST] Running AutoGrad..")


@cli.command()
@click.pass_context
def retrieve(context):
    """Retrieve available turned in submission"""
    course, assignment, submission = validate_opts(context)

    click.echo("[TEST] Running AutoGrad: Retrieving turned in submissions..")
    # Option 6
    a = AutoGrad() # Init
    a.retrieve(course, assignment, submission) # Get files, download
    
         
@cli.command()
@click.pass_context
def grade_local(context):
    """Grade local files"""
    course, assignment, submission = validate_opts(context)

    click.echo("[TEST] Running AutoGrad: Manual grade, local files")
    # Option 2 - Manual grade from local files, no download
    a = AutoGrad() # Init
    results = a.grade_files(course, assignment, submission)
    if len(results) > 0: a.save_grading_info(course, assignment, submission)

@cli.command()
@click.pass_context
def grade_download(context):
    """ Download and grade"""
    course, assignment, submission = validate_opts(context)

    click.echo("[TEST] Running AutoGrad: Retrieve and grade")
    # Option 1 - Manual grade, download first
    a = AutoGrad() # Init
    a.retrieve(course, assignment, submission) # Get files, download
    results = a.grade_files(course, assignment, submission) # Results of grading. Stored in results.json also
    a.save_grading_info(course, assignment, submission)

@cli.command()
@click.pass_context
def check(context):
    """Check available turned in submission"""
    course, assignment, submission = validate_opts(context)

    click.echo("[TEST] Running AutoGrad: Checking for turned in submissions..")
    import os

    a = AutoGrad() # Init
    a.boot() # Connect to Google APIs. This is not needed when testing  
    subs =  a.get_submissions_for_assignment(course, assignment, submission) # Get turned in submissions
    at = a.get_files_for_download(subs) # Get the .pde file attachments
    name = "turned_in_c%s_a%s_s%s.json" % (course,assignment,submission) 
    
    logs = os.path.join(a.BASE_DIR, 'logs') 
    fn = os.path.join(logs ,name)
    if not os.path.exists(logs): os.makedirs(logs)
    a.log_to_file(at,fn)
    
    click.echo("Currently turned in submissions logged to logs/turned_in_c{}_a{}_s{}.json".format(course,assignment,submission))

@cli.command()
@click.pass_context
def deploy(context):
    """Run complete process"""
    course, assignment, submission = validate_opts(context)

    click.echo("[DEPLOY] Running AutoGrad")
    
    # Start
    a = AutoGrad()

    # Download, grade, submit and mail. Sheets coming soon
    a.deploy(course, assignment, submission, return_grade=True)

@cli.command()
@click.pass_context
def submit_local(context): 
    """Submit locally graded files to classroom / mail"""
    course, assignment, submission = validate_opts(context)

    click.echo("[TEST] Running AutoGrad: Adding to Classroom from local results")
    # Option 3 - Manual Add to Classroom from graded results
    a = AutoGrad() # Init

    # IMPORTANT: Do not delete your logs folder just in case
    # results = a.attach_ids(course, assignment, submission)
    # status = a.add_to_classroom(course, assignment, results, return_grade=True)


@cli.command()
@click.pass_context
def mail_local(context):
    """ Mail locally stored results """ 
    course, assignment, submission = validate_opts(context)

    click.echo("[TEST] Running AutoGrad: Mail from local results")
    # Option 4 - Manual mailing
    import json, os

    a = AutoGrad() # Init
    # IMPORTANT: Do not delete your logs folder just in case
    dir = os.path.join('logs','2019-06-20-09-17-33', 'results.json')
    # p = '_'.join(course, assignment, submission)
    # dir = os.path.join('logs',p, 'results.json')
    f = open(dir,'r')
    res = json.load(f)
    status = a.send_mail(res)
    print(status)

def validate_opts(context):
    check_required = NIL not in list(context.obj.values())

    if check_required: 
        # Get command line options
        course = context.obj['course']
        assignment = context.obj['assignment']
        submission = context.obj['submission']
        return course, assignment, submission
    else:
        click.echo("Insufficient options. Exiting.. Try --help for more info")
        exit()


if __name__ == "__main__":
    cli(obj={})
        


