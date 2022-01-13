#!/data/data/com.termux/files/usr/bin/python
import json
import sys
from itertools import groupby
SMS = json.loads(sys.stdin.read())

class color:
   PURPLE = '\033[95m'
   CYAN = '\033[96m'
   DARKCYAN = '\033[36m'
   BLUE = '\033[94m'
   GREEN = '\033[92m'
   YELLOW = '\033[93m'
   RED = '\033[91m'
   BOLD = '\033[1m'
   UNDERLINE = '\033[4m'
   END = '\033[0m'

def key_func(k):
    return k['threadid']

SMS = sorted(SMS, key=key_func)
for key, value in groupby(SMS, key_func):
    values = list(value)
    if "sender" in dict(values[0]).keys():
        idx = "sender"
    else:
        idx = "number"
    print(color.UNDERLINE + values[0][idx] + color.END)
    for message in values:
        send_str = ""
        if message['type'] == 'sent':
            send_str = "Me"
        else:
            send_str = message[idx]
        print("{}: {}".format(send_str, message['body']))
    print("")