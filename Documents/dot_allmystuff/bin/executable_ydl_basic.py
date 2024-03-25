#!/usr/bin/python3
#

import os, sys, argparse
import yt_dlp
import yt_dlp.options

yt_opts = {
    "download_archive" : "/mnt/sgext/info/dlrx.txt",
    "paths" : {
        "home" : "/mnt/sgext/stuff/",
        "temp" : "/home/bruno/tmpydl"
    },
    "outtmpl" : { "default":
        '%(uploader)s__%(title)s_%(id)s_pl-%(playlist_index)sof%(playlist_count)s__PYDL.%(ext)s'
    },
    "format": 'b[height<=720][vbr<=3000]/b[vbr<=3000]/b[height<=540]/b[height<=720]/b[height>=480]/b',

    "retries": 3,
    "fragment_retries": 3,
    "file_access_retries": 4,

    "retry_sleep_functions": {
        "http": "",
        "fragment": "",
        "file_access": ""
    },

    "cookiesfrombrowser": (
        "chrome", "/home/bruno/.local/share/qutebrowser/webengine/", None, None
    ),

    "nopart": True,
    "restrictfilenames" : True,
    "updatetime" : False,
    "mark_watched": True,

    "username": "smutthrowaway1234",
    "password": "flcutters28",
}

parser = argparse.ArgumentParser(description="yt-dlp wrapper")
# See docs: https://docs.python.org/2/library/argparse.html#nargs
# Could be good to try nargs=argparse.REMAINDER to interpret all trailing args as a list of URLs
parser.add_argument('urls', metavar='url', nargs='+', help='URL(s) to download')
args = parser.parse_args()

def main():
    with yt_dlp.YoutubeDL(yt_opts) as ydl:
        ydl.download(args.urls)

if __name__ == "__main__":
    main()
