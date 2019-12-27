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
    "move":"Works with grade-download and grade-local. Specify whether after grading you want to move the graded files to graded folder. Set this to false when you're not sure your test script is bulletproof."
}
   
@click.group()  #(invoke_without_command=True)
@click.option('--move','-m', default='true',help=docs['move'])
@click.option('--submission', '-s', type=click.Choice( ALLOWED_RESUBS ), default="1", help=docs["submission"])
@click.option('--course', '-c', help=docs["course"])
@click.option('--assignment', '-a', type=click.Choice( ALLOWED_ASSIGNMENTS ),  help=docs["assignment"])
@click.pass_context
def cli(context, course, assignment, submission, move):
    context.ensure_object(dict) #

    # Attach the inputs to context object
    context.obj['course'] = course or NIL
    context.obj['assignment'] = assignment or NIL
    context.obj['submission'] = submission or NIL
    context.obj['move'] = move or NIL
    # context.obj['file'] = file or NIL

    # if context.invoked_subcommand is None:
    #     # If we don't add 'deploy' argument it means we want to do tests
    #     click.echo("[TEST] Running AutoGrad..")


@cli.command()
@click.pass_context
def retrieve(context):
    """Retrieve available turned in submission"""
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']

    click.echo("[TEST] Running AutoGrad: Retrieving turned in submissions..")
    # Option 6
    a = AutoGrad() # Init
    a.retrieve(course, assignment, submission) # Get files, download
    
         
@cli.command()
@click.pass_context
def grade_local(context):
    """Grade local files"""
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']
    move = ctx['move']

    click.echo("[TEST] Running AutoGrad: Manual grade, local files")
    # Option 2 - Manual grade from local files, no download
    a = AutoGrad() # Init
    results = a.grade_files(course, assignment, submission, move)
 

@cli.command()
@click.pass_context
def grade_download(context):
    """ Download and grade"""
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']
    move = ctx['move']

    click.echo("[TEST] Running AutoGrad: Retrieve and grade")
    # Option 1 - Manual grade, download first
    a = AutoGrad() # Init
    a.retrieve(course, assignment, submission) # Get files, download
    results = a.grade_files(course, assignment, submission, move) # Results of grading. Stored in results.json also
 

@cli.command()
@click.pass_context
def check(context):
    """Check available turned in submission"""
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']
    
    click.echo("[TEST] Running AutoGrad: Checking for turned in submissions..")
    import os

    a = AutoGrad() # Init
    a.boot() # Connect to Google APIs. This is not needed when testing  
    subs =  a.get_submissions_for_assignment(course, assignment, submission) # Get turned in submissions
    at = a.get_files_for_download(subs) # Get the .pde file attachments
    # name = "turned_in_c%s_a%s_s%s.json" % (course,assignment,submission) 
    
    # logs = os.path.join(a.BASE_DIR, 'logs') 
    # fn = os.path.join(logs ,name)
    # if not os.path.exists(logs): os.makedirs(logs)
    # if len(at) > 0:
    #     a.log_to_file(at,fn)
    #     click.echo("Currently turned in submissions logged to logs/turned_in_c{}_a{}_s{}.json".format(course,assignment,submission))

@cli.command()
@click.pass_context
def deploy(context):
    """Run complete process"""
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']
    move = ctx['move']

    click.echo("[DEPLOY] Running AutoGrad")
    
    # Start
    a = AutoGrad()

    # Download, grade, submit and mail. Sheets coming soon
    a.deploy(course, assignment, submission, move, return_grade=True)

@cli.command()
@click.pass_context
def submit_local(context): 
    """Submit locally graded files to classroom / mail"""
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']

    click.echo("[TEST] Running AutoGrad: Adding to Classroom from local results")
    # Option 3 - Manual Add to Classroom from graded results
    a = AutoGrad() # Init

    # IMPORTANT: Do not delete your logs folder just in case
    results = a.attach_ids(course, assignment, submission)
    results = remove_duplicates(results) # Remove old if any
    # a.log_to_file(results,'res.json')
    status = a.add_to_classroom(course, assignment, results, return_grade=True)

@cli.command()
@click.pass_context
def mail_local(context):
    """ Mail locally stored results """ 
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']
 
    click.echo("[TEST] Running AutoGrad: Mail from local results")
    # Option 4 - Manual mailing
    import json, os

    a = AutoGrad() # Init
    # IMPORTANT: Do not delete your logs folder just in case
    p = '_'.join([course, assignment, submission])
    dir = os.path.join('logs',p, 'results.json')
    f = open(dir,'r')
    res = json.load(f)
    f.close()
    final = remove_duplicates(res)
    a.log_to_file(final, 'email.json')

    status = a.send_mail(final) # Edit sub_limit to allow multiple submissions. Will integrate later
    a.recycle(os.path.join('logs',p,'results.json')) # recycle results file after mailing
    

@cli.command()
@click.pass_context
def move(context):
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']

    a = AutoGrad()  
    assignment_dir = a.get_assignment_dir(course, assignment, submission)
    graded_dir = a.get_graded_dir(course, assignment, submission)
    a.move_to_graded(assignment_dir, graded_dir)

@cli.command()
@click.pass_context
def undo_move(context):
    ctx = validate_opts(context)
    course = ctx['course']
    assignment = ctx['assignment']
    submission = ctx['submission']
    
    a = AutoGrad()
    assignment_dir = a.get_assignment_dir(course, assignment, submission)
    graded_dir = a.get_graded_dir(course, assignment, submission)
    a.undo_move(graded_dir, assignment_dir)

def remove_duplicates(res):
    new = sorted(res, key=lambda k: k['when'], reverse=True)
    dups = []
    def pop_dups(el):
        if el['details']['userId'] not in dups:
            dups.append(el['details']['userId'])
            return True
        return False
    return list(filter(lambda el: pop_dups(el) ,new))
    
def validate_opts(context):
    check_required = NIL not in list(context.obj.values())

    move = context.obj["move"]
   
    if check_required: 
        # Get command line options
        course = context.obj['course']
        assignment = context.obj['assignment']
        submission = context.obj['submission']
        
        #return course, assignment, submission, move
        return context.obj
    else:
        click.echo("Insufficient options. Exiting.. Try --help for more info")
        exit()


if __name__ == "__main__":
    cli(obj={})
        


