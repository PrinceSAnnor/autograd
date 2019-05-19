import glob
import os
import shutil
from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive

gauth = GoogleAuth()

gauth.LoadCredentialsFile("mycreds.txt")
if gauth.credentials is None:
    # Authenticate if they're not there
    gauth.LocalWebserverAuth()
elif gauth.access_token_expired:
    # Refresh them if expired
    gauth.Refresh()
else:
    # Initialize the saved creds
    gauth.Authorize()
# Save the current credentials to a file
gauth.SaveCredentialsFile("mycreds.txt")

drive = GoogleDrive(gauth)


def get_latest_files(group_name, assignment_name):
    # Create target Directory if don't exist
    loc = "../assets/code/" + group_name + "/" + assignment_name

    if not os.path.exists(loc):
        os.makedirs(loc)
        print("Directory " , loc ,  " Created")
    else:    
        print("Directory " , loc ,  " already exists,")
    
    # cd to the group's assignment folder 
    os.chdir(loc)
    
    print("Running...")
    
    file_list = drive.ListFile({'q': "'0B_r2YwxNRUHmfndfT3l5aGw5bzY1Rzd0NkNDemhnc0lxZWtuWUpEcHJDZ2pOY1pYWHdTZ0E' in parents and trashed=false"}).GetList()
    for file1 in file_list:
        if group_name in file1['title']:
            # Get the goup folder
            class_folder = drive.ListFile({'q': "'%s' in parents and trashed=false" % file1['id']}).GetList()
            
            for ass_folder in class_folder:
                # Get the files in the assignment folder if it exists in the group folder
                if assignment_name in ass_folder['title'] and ass_folder['mimeType'] == 'application/vnd.google-apps.folder':
                    files = drive.ListFile({'q': "'%s' in parents and trashed=false" % ass_folder['id']}).GetList()
                    
                    # Get processing source files in asignment folder
                    for file in files:
                        if '.pde' in file['title']:
                            # Extract relevant data
                            date_raw = file['modifiedDate']
                            date_list = date_raw.split('T')
                            date = date_list[0]
                                
                            time_list = date_list[1].split('.')
                            time = time_list[0]
                            formatted_time = time.replace(":", "-")
                                           
                            """
                            If the students folder does not exist
                            create the folder, download the most recent submitted assignment and rename it
                            """
                            if not os.path.isdir(file['lastModifyingUserName']):
                                try:
                                    os.mkdir(file['lastModifyingUserName'])
                                    os.chdir(file['lastModifyingUserName'])
                                    file.GetContentFile(file['title'])
                                    os.rename(file['title'], file['id'] + " " + date + " " + formatted_time + ".pde")
                                    os.chdir("../")
                                except:
                                    os.chdir("../")
                            # """
                            # If the students folder exists
                            # 1. check if its not empty
                            # 2. check if its an older version, delete the current file and dowonload the new one
                            # """
                            elif os.path.isdir(file['lastModifyingUserName']):
                                try:
                                    os.chdir(file['lastModifyingUserName'])
                                    files = os.listdir()
                                    if len(files) > 0:
                                        file_name = files[0]
                                        
                                        name1 = file_name.split(".")
                                        file_data = name1[0].split()
                                        
                                        file_id = file_data[0]
                                        file_date = file_data[1]
                                        file_time = file_data[2].replace("-", ":")
                                            
                                        if (date  > file_date) or (date == file_date and time > file_time): 
                                            #remove current file
                                            os.remove(file_name)
                                            print("repalced %s" % file_name)
                                                
                                            #download new file
                                            file.GetContentFile(file['title'])
                                            os.rename(file['title'], file['id'] + " " + date + " " + formatted_time + ".pde")
                                    else:
                                        print("Folder exists but no file was found")
                                        
                                    os.chdir("../");
                                except:
                                    os.chdir("../")
    os.chdir("../../../../drive") #bad code... but using jupyter, will fix later
    print('Done!')

# get_latest_files("SuaCode Africa 1", "Assignment 1")

# get_latest_files("SuaCode Africa 2", "Assignment 1")

# get_latest_files("SuaCode Africa 3", "Assignment 1")

get_latest_files("Test Class", "Assignment 1")

# def get_files(group_name, assignment_name):
# # Create target Directory if don't exist
#     loc = "../assets/code/" + group_name + "/" + assignment_name

#     if not os.path.exists(loc):
#         os.makedirs(loc)
#         print("Directory " , loc ,  " Created")
#     else:    
#         print("Directory " , loc ,  " already exists, \ni'll delete and create a new one beacause i don't have time to come up with a better algorithm")
#         shutil.rmtree(loc)
#         os.makedirs(loc)
#     os.chdir(loc)
    
#     print("Running...")
    
#     file_list = drive.ListFile({'q': "'0B_r2YwxNRUHmfndfT3l5aGw5bzY1Rzd0NkNDemhnc0lxZWtuWUpEcHJDZ2pOY1pYWHdTZ0E' in parents and trashed=false"}).GetList()
#     for file1 in file_list:
#         if group_name in file1['title']:
#             class_folder = drive.ListFile({'q': "'%s' in parents and trashed=false" % file1['id']}).GetList()
#             for ass_folder in class_folder:
#                 if assignment_name in ass_folder['title'] and ass_folder['mimeType'] == 'application/vnd.google-apps.folder':
#                     files = drive.ListFile({'q': "'%s' in parents and trashed=false" % ass_folder['id']}).GetList()
#                     for file in files:
#                         if '.pde' in file['title']:
#                             if os.path.isdir(file['lastModifyingUserName']):
#                                 os.chdir(file['lastModifyingUserName'])
#                                 number = len(os.listdir('.'))
#                                 index = str(number + 1);
#                                 full_name = index + ".pde"
#                                 file.GetContentFile(file['title'])
#                                 os.rename(file['title'], full_name)
#                                 print("%s, %s, %s" % (file['lastModifyingUserName'], full_name, file['modifiedDate']))
#                             elif not os.path.isdir(file['lastModifyingUserName']):
#                                 os.mkdir(file['lastModifyingUserName'])
#                                 os.chdir(file['lastModifyingUserName'])
#                                 file.GetContentFile(file['title'])
#                                 os.rename(file['title'], "1.pde")
#                                 print("%s, %s, %s" % (file['lastModifyingUserName'], "1.pde", file['modifiedDate']))
#                             os.chdir("../")   
        
#     os.chdir("../../../../drive")#bad code... but using jupyter, will fix later
#     print('Done!')

# get_files('SuaCode Africa 1', 'Assignment 1')
# get_files('SuaCode Africa 2', 'Assignment 1')


