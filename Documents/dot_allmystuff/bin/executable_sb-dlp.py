#!/usr/bin/python3
#

import os, sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
# sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath( "/home/bruno/.config/yt-dlp/config"))))

import argparse, json, re
import yt_dlp
import yt_dlp.options # see: https://github.com/yt-dlp/yt-dlp/blob/master/devscripts/cli_to_api.py
from pprint import pprint
from bs4 import BeautifulSoup as bs
from urllib.request import Request, urlopen

create_parser = yt_dlp.options.create_parser

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

def parse_patched_options(opts):
    patched_parser = create_parser()
    patched_parser.defaults.update({
        'ignoreerrors': False,
        'retries': 0,
        'fragment_retries': 0,
        'extract_flat': False,
        'concat_playlist': 'never',
    })
    yt_dlp.options.create_parser = lambda: patched_parser
    try:
        return yt_dlp.parse_options(opts)
    finally:
        yt_dlp.options.create_parser = create_parser

default_opts = parse_patched_options([]).ydl_opts

def cli_to_api(opts, cli_defaults=False):
    opts = (yt_dlp.parse_options if cli_defaults else parse_patched_options)(opts).ydl_opts

    diff = {k: v for k, v in opts.items() if default_opts[k] != v}
    if 'postprocessors' in diff:
        diff['postprocessors'] = [pp for pp in diff['postprocessors']
                                  if pp not in default_opts['postprocessors']]
    return diff

# http://stackoverflow.com/questions/53911695/ddg#53911911
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
    yt_opts = {}
    with yt_dlp.YoutubeDL( yt_opts ) as ydl:
        ydl.download( [pl_canonical_url] )

def test_parsing( url ):
    list_pl_vid_urls = get_pl_vid_urls_from_pl( url )

    for pl_vid_url in list_pl_vid_urls:
        canonical_url = get_canonical_url_from_pl_vid( pl_vid_url )
        print( pl_vid_url, "\t-->\t", canonical_url )

def my_arg_parser(opts):
    parser = argparse.ArgumentParser(
        prog="sb-dlp", description="Download videos from SpankBang playlist, logging the static video ids", epilog="By default, the playlist is 'Favorites'."
    )
    parser.add_argument('url',
                        default="https://spankbang.com/7x3a7-lta0j5/playlist/favorites",
                        help="URL of the playlist or playlist-video")
    parser.add_argument('-d',
                        help="[d]ry-run -- print info w/o downloading", dest="dryrun", action='store_true')
    args = parser.parse_args()

    url, dryrun = args.url, args.dryrun
    return url, dryrun

if __name__ == "__main__":
    from pprint import pprint

    print('Args + CLI:\n')
    pprint( cli_to_api( sys.argv[1:], True ))

    # list_pl_vid_urls = get_pl_vid_urls_from_pl( url )
    # for pl_vid_url in list_pl_vid_urls:
    #     canonical_url = get_canonical_url_from_pl_vid( pl_vid_url )
    #     if not dryrun:
    #         download_vid_from_canonical_url( canonical_url )
