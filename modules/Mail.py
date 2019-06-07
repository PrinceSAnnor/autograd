from __future__ import print_function
import pickle, os, io, http, mimetypes, base64
from googleapiclient.discovery import build
from google_auth_oauthlib.flow import InstalledAppFlow
from google.auth.transport.requests import Request
from email.mime.text import MIMEText

from googleapiclient.errors import HttpError


# If modifying these scopes, delete the file token.pickle.
SCOPES = ['https://www.googleapis.com/auth/gmail.compose', 'https://mail.google.com/']

class Mail(object):

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
        token_f = os.getcwd() + '/credentials/mail-token.pickle' # path to token file
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

        self.service = build('gmail', 'v1', credentials=creds)
    
    def get_profile(self, id):
        profile = self.service.users().getProfile(userId = id).execute()
        return profile
        

    def send_message(self, to, subject, message_text):
        """Send an email message.

        Args:
            service: Authorized Gmail API service instance.
            user_id: User's email address. The special value "me"
            can be used to indicate the authenticated user.
            message: Message to be sent.

        Returns:
            Sent Message.
        """
        try:
            message = MIMEText(message_text)
            message['to'] = to
            message['from'] = 'me'
            message['subject'] = subject
            f_message = {'raw': base64.urlsafe_b64encode(message.as_string().encode()).decode()}

            message_ = self.service.users().messages().send(userId='me', body=f_message).execute()
            print ('Message Id: %s' % message_['id'])
            return message_
        except HttpError as error:
            print ('An error occurred: %s' % error)
    
if __name__ == "__main__":
    pass

    