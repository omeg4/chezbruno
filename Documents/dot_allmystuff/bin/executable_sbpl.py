#!/usr/bin/python3
#

import os, sys, argparse
import yt_dlp
import yt_dlp.options
from urllib.request import Request, urlopen
from bs4 import BeautifulSoup as bs

# TODO: Log both the playlist_id and the canonical_id in `dlrx.txt`
#   * --skip-download will write related files (e.g. dlrx.txt) without re-downloading.
#       * yt_opts_skip_dl = { 'skip_download' : True, **yt_opts } 
# TODO: Split up `yt-opts` for different use cases, merging as needed for each `YoutubeDL` call.
#   * dict_merge = { **dict1, **dict2, ..., **{ "ad-hoc_key1" : "ad-hoc_val1", ... } }

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
    "fragment_retries": 10,
    "file_access_retries": 4,

    "retry_sleep_functions": {
        "http": "linear=30:300:30",
        "fragment": "exp=1:300:2",
        "file_access": "linear=30:300:30"
    },

    "cookiesfrombrowser": (
        "chrome", "/home/bruno/.local/share/qutebrowser/webengine/", None, None
    ),

    "nopart": True,
    "restrictfilenames" : True,
    "updatetime" : False,
    "mark_watched": True,

    "throttledratelimit" : 307200,

    # "username": "smutthrowaway1234",
    # "password": "flcutters28",
}

# See docs: https://docs.python.org/2/library/argparse.html#nargs
# parser.add_argument('urls', metavar='url', nargs='+', help='URL(s) to download')
# Could be good to try nargs=argparse.REMAINDER to interpret all trailing args as a list of URLs

parser = argparse.ArgumentParser(description="yt-dlp wrapper")
parser.add_argument('-v', '--verbose', action='store_true', help='verbose output')
parser.add_argument('urls', metavar='url', nargs=argparse.REMAINDER, help='URL(s) to download')
args = parser.parse_args()

def parse_sb_url( sb_url ):
    #-@diagnostic disable: string
    '''
    Parse the input URL and determine if it's a video (canonical), playlist, or playlist video.
        Canonical: "https://spankbang.com/video/\w+"
        Playlist:   "https://spankbang.com/(\w{5})/playlist/(.*)"
    '''

def get_pl_vid_urls_from_pl( pl_url ):
    list_pl_vids_on_page = []
    req = Request( pl_url, headers={ 'User-Agent': 'Mozilla/5.0' } )
    html_page = urlopen(req).read()
    soup = bs(html_page, "html.parser")
    for pl_vid_divs in soup.find("main", attrs={ "id" : "container" }).find_all( "div", attrs={ "class" : "video-item" } ):
        # pl_vid_url = pl_vid_divs.find( "a", attrs={ "class" : "n" } ).get("href")
        for pl_vid_urls in pl_vid_divs.find_all( "a", attrs={ "class" : "n" } ):
            pl_vid_url = pl_vid_urls.get("href")
            pl_vid_url = "https://spankbang.com" + pl_vid_url
            list_pl_vids_on_page.append( pl_vid_url )
    return list_pl_vids_on_page

def get_canonical_url_from_pl_vid( pl_vid_url ):
    req = Request( pl_vid_url, headers={ 'User-Agent': 'Mozilla/5.0' } )
    html_page = urlopen(req).read()
    soup = bs(html_page, "html.parser")
    canonical_url = soup.find( "link", attrs={"rel": "canonical"} ).get("href")
    return canonical_url

def download_vid_from_canonical_url( pl_canonical_url ):
    try:
        with yt_dlp.YoutubeDL(yt_opts) as ydl:
            ydl.download( pl_canonical_url )
        return { "Outcome" : "Success", "Canonical URL" : pl_canonical_url }
    except:
        return { "Outcome" : "Failed", "Canonical URL" : pl_canonical_url }

def proc_sb_pl_url( sb_pl_url ):
    pl_vid_list = get_pl_vid_urls_from_pl( args.urls[0] )
    for pl_vid in pl_vid_list:
        vid_canonical_url = get_canonical_url_from_pl_vid( pl_vid ) 
        canonical_result = download_vid_from_canonical_url( vid_canonical_url )
        if canonical_result["Outcome"] == "Success":
            with yt_dlp.YoutubeDL( { "skip_download" : True, "force_write_download_archive" : True, **yt_opts } ) as ydl:
                ydl.download( pl_vid )
                print( "Updated dlrx.txt with PL and Canonical URL:\n\t{}\n\t{}".format( canonical_result["Canonical URL"], pl_vid ) )
        else:
            print( "Canonical Download Failed: \n\tPL: {}\n\tCN: {}".format( pl_vid, vid_canonical_url ) )

def main():
    print("Input URL Arg: " + args.urls) if args.verbose else None
    proc_sb_pl_url( args.urls[0] )

if __name__ == "__main__":
    main()
