from __future__ import print_function
import pickle
import os.path
from googleapiclient.discovery import build
from googleapiclient.http import MediaIoBaseDownload
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
import http
import io

# If modifying these scopes, delete the file token.pickle.
SCOPES = ['https://www.googleapis.com/auth/drive']

class Drive(object):

    def __init__(self):
        self.service = None
        self.boot()
        
    def boot(self):
        """Shows basic usage of the Drive v3 API.
        Prints the names and ids of the first 10 files the user has access to.
        """
        creds = None
        # The file token.pickle stores the user's access and refresh tokens, and is
        # created automatically when the authorization flow completes for the first
        # time.
        token_f = os.getcwd() + '/credentials/drive-token.pickle' # path to token file
        creds_f = os.getcwd() + '/credentials/credentials.json' # path to credentials.json file
        if os.path.exists(token_f):
            with open(token_f, 'rb') as token:
                creds = pickle.load(token)
        # If there are no (valid) credentials available, let the user log in.
        if not creds or not creds.valid:
            if creds and creds.expired and creds.refresh_token:
                creds.refresh(Request())
            else:
                flow = InstalledAppFlow.from_client_secrets_file(
                    creds_f, SCOPES)
                creds = flow.run_local_server()
            # Save the credentials for the next run
            with open(token_f, 'wb') as token:
                pickle.dump(creds, token)

        self.service = build('drive', 'v3', credentials=creds)

    def get_folder_id(self, id, name):
        # Call the Drive v3 API
        results = self.service.files().list(
            q="'" + id + "' in parents and name contains '" + name + "'",
            spaces='drive',
            fields='nextPageToken, files(id, name)',
            pageToken=None
        ).execute() 

        item = results.get('files', [])

        if not item:
            return None
        else:
            return item[0]['id']
    
    # previous method to get code files
    def get_code_files(self, id):
        results = self.service.files().list(
            q="'" + id + "' in parents and name contains '.pde'",
            spaces='drive',
            fields='nextPageToken, files(id, name, owners, lastModifyingUser(displayName, emailAddress))',
            pageToken=None
        ).execute() 

        items = results.get('files', [])

        if not items:
            return None
        else:
            for item in items:
                print(item['name'], item['id'], item['owners'])

    def get_file(self, id, name):
        request = self.service.files().get_media(fileId=id)
        fh = io.FileIO(name, 'wb')
        downloader = MediaIoBaseDownload(fh, request)
        done = False
        while done is False:
            status, done = downloader.next_chunk()
            return done