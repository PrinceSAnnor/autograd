# AutoGrad
Automatic grading system for SuaCode   
Email: suacode.app@gmail.com
 
 
# Installing

## Install the latest version of Python 3. 
Latest release can be found at (https://python.org)

**Install Python and make sure you select 'add to PATH' especially on Windows. Linux and Mac tend to do that by default.**

## Install Processing Java on your target machine. 
Processing Java, latest release can be found at (https://processing.org)

**After installing, add Processing Java to your PATH.**

## Install project dependencies
Execute this from your command-line/terminal in the root directory (where requirements.txt is found)

```pip install -r requirements.txt```

NOTE: Consider using a virtualenv to manage project modules and dependencies. See this link on creating a virtualenv for Python modules: (https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/)

## Grading the SuaCode course

### 1. DEPLOY
- You download all the code, grade, upload results and email.

Usage: `python auto.py -c 1 -a 1 -s 1 deploy`

Help: This will do everything. the flags stand for the ff:
`-c 1` is short hand for `--course=1`, `-a 1` is shorthand for `--assignment=1` and same for submission. You can use long or short hand. 

### 2. CHECK
You want to check if there are any submissions to the classroom without opening your browser.

Usage: `python auto.py -c 1 -a 1 -s 1 check`

Help: This will retrieve information about turned in submission and log them to a file called turned_in_a1_s1_c1.json in the logs folder based on the options.

### 3. DOWNLOAD and GRADE only
Sometimes you just want to download and only grade. This makes sense since sometimes because of the way we currently grade Assignments 3 - 6 where we copy out their code into a Code class and retain the syntax errors.
We have done all a lot of bulletproofing in the past so things like students using magic numbers and forgetting variables don't break the grading but anything can happen.

Usage: `python auto.py -c 1 -a 1 -s 1 grade-download`

Help: Downloads the files into the assets/code folder , grades the files one by one, moves successfully graded files to assets/graded and logs results in logs/1_1_1/results.json (underscored folder names according to course, assignment, submission)

### 4. *GRADE already downloaded files*
This just takes files in assets/code per the options given, grades and appends results to logs/1_1_1/results.json file.

Usage: `python auto.py -c 1 -a 1 -s 1 grade-local`

Help: This will grade files, move to assets/graded if successful and append results to logs/1_1_1/results.json

### 5. MOVE
The grade-download and grade-local commands by default move the files after grading to assets/graded folder. In development of the Assignment test scripts we may have bugs and so you would not want the graded files to be moved so you can grade them multiple times before you're sure the test script is perfect for all scenarios. In that case just add the option flag `--move=false` or `-m false`

Usage: `python auto.py -c 1 -a 1 -s 1 -m false grade-download` or  `python auto.py -c 1 -a 1 -s 1 -m false grade-local`

Help: This will prevent moving of the files to the graded folder after grading.

### 6. SUBMIT graded results using Autograd
Supposing you did grade-local or grade-download. those commands don't automatically upload results to Classroom or Mail results. You can take the aggregated grades and submit to Classroom. This submits as an assignedGrade and does not return the grade.

Usage: `python auto.py -c 1 -a 1 -s 1 submit-local`

### 7 Email using Autograd
You can email results that are stored locally in logs. This will only work for 1st submission and skip for the rest.

Usage: `python auto.py -c 1 -a 1 -s 1 email-local`

Help: This will take results from the logs folder and email it to the student.
It requires that you have the students CSV file in assets/student-details/SuaCode Africa X , where X is eg. 1 for SuaCode Africa 1.


# Contributing 
Work on issues: https://www.youtube.com/watch?v=Da0QOIvsKqU

