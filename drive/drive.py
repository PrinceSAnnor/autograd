#!/usr/bin/env python
# coding: utf-8

# In[7]:


import glob
import os
import shutil


# In[8]:


from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive


# In[9]:


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


# In[10]:


def get_files(group_name, assignment_name):
# Create target Directory if don't exist
    loc = "../assets/code/" + group_name + "/" + assignment_name

    if not os.path.exists(loc):
        os.makedirs(loc)
        print("Directory " , loc ,  " Created")
    else:    
        print("Directory " , loc ,  " already exists, \ni'll delete and create a new one beacause i don't have time to come up with a better algorithm")
        shutil.rmtree(loc)
        os.makedirs(loc)
    os.chdir(loc)
    
    print("Running...")
    
    file_list = drive.ListFile({'q': "'0B_r2YwxNRUHmfndfT3l5aGw5bzY1Rzd0NkNDemhnc0lxZWtuWUpEcHJDZ2pOY1pYWHdTZ0E' in parents and trashed=false"}).GetList()
    for file1 in file_list:
        if group_name in file1['title']:
            class_folder = drive.ListFile({'q': "'%s' in parents and trashed=false" % file1['id']}).GetList()
            for ass_folder in class_folder:
                if assignment_name in ass_folder['title'] and ass_folder['mimeType'] == 'application/vnd.google-apps.folder':
                    files = drive.ListFile({'q': "'%s' in parents and trashed=false" % ass_folder['id']}).GetList()
                    for file in files:
                        if '.pde' in file['title']:
                            if os.path.isdir(file['lastModifyingUserName']):
                                os.chdir(file['lastModifyingUserName'])
                                number = len(os.listdir('.'))
                                index = str(number + 1);
                                full_name = index + ".pde"
                                file.GetContentFile(file['title'])
                                os.rename(file['title'], full_name)
                                print("%s, %s, %s" % (file['lastModifyingUserName'], full_name, file['modifiedDate']))
                            elif not os.path.isdir(file['lastModifyingUserName']):
                                os.mkdir(file['lastModifyingUserName'])
                                os.chdir(file['lastModifyingUserName'])
                                file.GetContentFile(file['title'])
                                os.rename(file['title'], "1.pde")
                                print("%s, %s, %s" % (file['lastModifyingUserName'], "1.pde", file['modifiedDate']))
                            os.chdir("../")   
        
    os.chdir("../../../../drive")#bad code... but using jupyter, will fix later
    print('Done!')


# In[11]:


get_files('SuaCode Africa 1', 'Assignment 1')


# In[5]:


get_files('SuaCode Africa 2', 'Assignment 1')


# In[7]:


get_files('SuaCode Africa 3', 'Assignment 1')


# In[13]:


#myCmd = 'processing-java --sketch="' + os.getcwd() + '\..\\pong_1" --output="' + os.getcwd() + '\..\\pong_1\\build"' + ' --force --run'
#newMyCmd = myCmd.replace("\\", "/")

#os.system(newMyCmd)


# In[12]:


os.getcwd()

