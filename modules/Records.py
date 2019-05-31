import os
from datetime import datetime


class Records(object):
    date = datetime.today().strftime('%Y-%m-%d_%H-%M-%S')
    date_str = str(date)
    dir_path = os.getcwd() + "/assets/records/" + date_str +'/'
    
    def __init__(self):
        self.create_dir()

    def create_dir(self):
        if not os.path.exists(self.dir_path):
            os.makedirs(self.dir_path)
        
    def log_no_attachments(self, text):
        f = open(self.dir_path + "no-attachments.txt", "a+")
        f.write(str(text) + '\n')
        f.close()

    def log_no_drive_file(self, text):
        f = open(self.dir_path + "no-drive-file.txt", "a+")
        f.write(str(text) + '\n')
        f.close()

    def log_not_submitted(self, text):
        f = open(self.dir_path + "/not_submitted.txt", "a+")
        f.write(str(text) + '\n')
        f.close()

    def log_results(self, text):
        f = open(self.dir_path + "/results.txt", "a+")
        f.write(str(text) + '\n')
        f.close()
