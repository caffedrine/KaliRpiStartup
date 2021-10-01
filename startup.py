import time
import datetime
import sys

def get_timestamp():
    return datetime.datetime.fromtimestamp(time.time()).strftime('%Y-%m-%d %H:%M:%S.%f')[:-3]

def log(str_text):
    formatted_str = ("[%s] %s\n" % (get_timestamp(), str_text))
    sys.stdout.write(str(formatted_str))
    sys.stdout.flush()

log("Python executed successfully")
