#!/usr/bin/env python
# coding: utf-8

# In[2]:


import os


# In[8]:


#for now well just call the scripts


# download files
#print("Downloading files...")
#os.chdir('"' + os.getcwd() + '/drive/"')
#drive_cmd = 'python ' + '"' + os.getcwd() + '/drive/drive.py"'
#drive_cmd = 'python ' + '"drive.py"'
#os.system(drive_cmd)
#os.chdir("../")
#print("Done Downloading")


# In[13]:


#Grade files
print("Grading files...")

prosessing_cmd = 'processing-java --sketch="' + os.getcwd() + '/pong_1" --output="' + os.getcwd() + '/pong_1/build"' + ' --force --run'

os.system(prosessing_cmd)

print("Done grading")


# In[ ]:




