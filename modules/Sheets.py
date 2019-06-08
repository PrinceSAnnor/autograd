import gspread
import csv, os
from oauth2client.service_account import ServiceAccountCredentials

#For the json file you'll need to share the client email provided with desired sheet file you want to edit
#scope for spreadsheets and for drive

class Sheets(object):
    
    def __init__(self):
        self.gc = None
        self.boot()
    
    def boot(self):
        scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive' ]

        creds_f = os.getcwd() + '/credentials/SuaCode Africa-f482d6649058.json'
        credentials = ServiceAccountCredentials.from_json_keyfile_name(creds_f, scope)

        self.gc = gspread.authorize(credentials)

    def get_worksheet(self, course):
        return self.gc.open(course).sheet1
