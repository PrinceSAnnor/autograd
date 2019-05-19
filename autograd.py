import os

#Grade files
print("Grading files...")

prosessing_cmd = 'processing-java --sketch="' + os.getcwd() + '/pong_1" --output="' + os.getcwd() + '/pong_1/build"' + ' --force --run'

os.system(prosessing_cmd)

print("Done grading")
