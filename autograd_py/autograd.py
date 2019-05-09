#!/usr/bin/env python
# coding: utf-8

# In[1]:


import glob
import os
import shutil


# In[2]:


from pydrive.auth import GoogleAuth
from pydrive.drive import GoogleDrive


# In[3]:


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


# In[4]:


def get_files(group_name, assignment_name):
# Create target Directory if don't exist
    loc = group_name + "/" + assignment_name

    if not os.path.exists(loc):
        os.makedirs(loc)
        print("Directory " , loc ,  " Created")
    else:
        print("Directory " , loc ,  " already exists, \n i'll delete and create a new one beacause i don't have time to come up with a better algorithm")
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

    os.chdir("../../")
    print('Done!')


# In[5]:


get_files('SuaCode Africa 1', 'Assignment 1')


# In[6]:


get_files('SuaCode Africa 2', 'Assignment 1')


# In[ ]:


get_files('SuaCode Africa 3', 'Assignment 1')


# In[ ]:


myCmd = 'processing-java --sketch="' + os.getcwd() + '\..\\pong_1" --output="' + os.getcwd() + '\..\\pong_1\\build"' + ' --force --run'
newMyCmd = myCmd.replace("\\", "\\\\")

os.system(newMyCmd)


# In[ ]:


#def get_latest_files():

    #dirs = os.listdir(os.getcwd())
    #for name in dirs:
        #list_of_files = glob.glob(name + "/*.pde")
        #latest_file = max(list_of_files, key=file['modifiedDate'])

        #print (latest_file)

        #f = open("latest_files.txt","a+")
        #f.write("%s \n" % (latest_file))


# In[ ]:


os.getcwd()


# In[ ]:
