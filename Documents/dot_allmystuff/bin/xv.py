#!/usr/bin/python
#

import os
import subprocess as sp

def parse_filename(self,filename):
    splitname = filename.split('__').split('_')

class vid:
    def __init__(self, filename):
        self.filename = filename
        self.perfs = ''
        self.prod = ''
        self.tier = ''
        self.tags = ''

    def play(self):
        sp.run('mpv --profile=pron ' + filename)

class perf:
    def __init__(self, name):
        self.name = name
        self.fname = name.replace(' ','-').lower()
        self.nvids = sp.run('find /mnt/sgext/stuff -type f -iregex \'.*' + self.fname + '.*\' | wc -l', shell=True)
        print(self.name + ' has ' + self.nvids + ' vids in your library')

