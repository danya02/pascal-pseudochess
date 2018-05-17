#!/usr/bin/python3
import re
import string
file=None
with open('outp.pas') as o:
    for i in o:
        if re.match('{begin ['+string.printable+']*.pp}',i):
            file = i.split('{begin ')[1].split('}')[0]
        if file is not None:
            with open(file,'a') as outp:
                outp.write(i)
        if file is not None:
            if re.match('{end '+file+'}',i):
                file = None
