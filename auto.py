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
        # If we don't add 'deploy' argument we want to do tests
        click.echo("[TEST] Running AutoGrad..")
        a = AutoGrad()

        # Uncomment this line to download new files from Classroom drive folder. Not necessary if you have already downloaded the files
        # a.retrieve(course, assignment, submission)
        
        """ 
            Grade files. Skips errors from student's code. 
            NB: If you have already downloaded the files using retrieve() 
            you can supply the assignment, course and submission numbers to grade
            locally
        """
        results = a.grade_files(assignment_num=assignment, course_num=course, submission_num=submission)

        # Print results
        print(results)
        

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
        
        # Init
        a = AutoGrad()

        # Download, grade, submit and mail. Sheets coming soon
        a.deploy(course, assignment, submission, results)

    else:
        click.echo("Insufficient params. Exiting.. Try --help for more info")

if __name__ == "__main__":
    cli(obj={})
        


