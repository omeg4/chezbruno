#!/bin/python
#

import os, shutils
from pymediainfo import MediaInfo as mi
from glob import iglob as glob
from subprocess import call, Popen as popen

def get_img_info(f):
    fp = mi.parse(f).image_tracks[0]
    iar = float(fp.display_aspect_ratio)
    arsuff = ''
    if iar < 1:
        arsuff = 'imgar-vert'
    elif iar > 1:
        arsuff = 'imgar-land'
    elif iar == 1:
        arsuff = 'imgar-sq'
    else:
        arsuff = 'NO-AR'
    return arsuff

def get_vid_info(f):
    fp = mi.parse(f).video_tracks[0]
    iar = float(fp.display_aspect_ratio)
    arsuff = ''
    if iar < 1:
        arsuff = 'vidar-vert'
    elif iar > 1:
        arsuff = 'vidar-land'
    elif iar == 1:
        arsuff = 'vidar-sq'
    else:
        arsuff = 'NO-AR'
    return arsuff

cwd = os.getcwd() + '/'

ixt = ['jpg', 'jpeg', 'png']
vxt = ['mp4', 'avi', 'flv']

for g in glob(cwd + "*"):
    # replace spaces w/ _
    oldname = newname = g
    gext = os.path.splitext(g)[-1][1:]
    newname.replace(" ", "_")
    # check aspect ratio and include in newname var
    if gext in ixt:
        #do image stuff
        arsuff = get_img_info(g)
        #also optimize png files
        if gext == 'png':
            popen(["optipng", "-o", "1", g])
    elif gext in vxt:
        #do video stuff
        arsuff = get_vid_info(g)
    else:
        pass

