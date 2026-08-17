import ftplib
import os

ftp_server = '112.175.185.132'
username = 'kwonhj159'
password = 'K3898919!'
file_to_upload = 'index.html'

try:
    print(f"Connecting to {ftp_server}...")
    ftp = ftplib.FTP(ftp_server)
    ftp.login(username, password)
    
    print("--- Directory Listing ---")
    ftp.dir()
    print("-------------------------")
    
    ftp.quit()
except Exception as e:
    print(f"Error: {e}")
