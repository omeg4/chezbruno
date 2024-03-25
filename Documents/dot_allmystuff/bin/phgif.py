import sys
# import urllib
# from bs4 import BeautifulSoup

GIF_URL = sys.argv[1]

# soup = BeautifulSoup(urllib.request.urlopen(GIF_URL), "lxml")

# GIF_TITLE = soup.title.string
# GIF_TITLE = soup.select_one(
# GIF_TITLE = soup.find('title').renderContents()

GIF_ID = GIF_URL.split('/')[-1].split('.')[0]

# GIF_URL = 'https://dl.phncdn.com/gif/' + GIF_ID + 'a.webm'
# GIF_URL = 'https://www.pornhubpremium.com/embedgif/' + GIF_ID
# ID_LEN = len(GIF_ID) % 3

try:
    WEBM_URL = format(int(GIF_ID[:-6]), '03') + '/' + GIF_ID[-6:-3] + '/' + GIF_ID[-3:] + '/' + GIF_ID + 'a.webm'
except:
    WEBM_URL = '000/' + GIF_ID[-6:-3] + '/' + GIF_ID[-3:] + '/' + GIF_ID + 'a.webm'

# print(GIF_URL)
# print(GIF_TITLE)
print(WEBM_URL)
