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

