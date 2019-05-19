import os

if not os.path.exists("assets/id-lists/"):
    # Get Students
    print("Getting students names and ids...")
    os.makedirs("assets/id-lists/")

    os.chdir(os.getcwd() + '/classroom')
    os.system('python get_students.py')
    os.chdir('../')

# Get files
print("Downloaing files...")

os.chdir(os.getcwd() + '/drive')
os.system('python drive.py')
os.chdir('../')

# run  processing
print("Grading files...")

prosessing_cmd = 'processing-java --sketch="' + os.getcwd() + '/pong_1" --output="' + os.getcwd() + '/pong_1/build"' + ' --force --run'
os.system(prosessing_cmd)

# Upload Results
print("Uploading results...")

os.chdir(os.getcwd() + '/classroom')
os.system('python grade.py')
os.chdir('../')

print("Ma wie oo..................")
