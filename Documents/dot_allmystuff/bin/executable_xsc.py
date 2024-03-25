#/usr/bin/python
#

import os, argparse, shlex
import subprocess as sp

parser = argparse.ArgumentParser(description='spawn some mpvs')

parser.add_argument('-n', metavar='n', type=int,
    default=1,
    help="number of mpv instances to spawn"
)
parser.add_argument('-o', metavar='o', default='v',
    nargs="+", choices=['v', 'h', 'a'],
    help='select [v]ert, [h]orizontal, or spawn [a]lternating'
)
parser.add_argument('-w', metavar='w',
    nargs="*", default='s',#choices=['s','n','fl','gate','oz','abq'],
    choices=['s','n','fl','gate','oz','abq','dar','shay','lsoko','jboss','rsed','des', 'mand', 'dsku', 'gbelf','krislen'],
    help='filter only [n]otch, show all [s]ocmeds, or input custom list'
)
parser.add_argument('-r', metavar='r', nargs='*', default=['g','s'], choices=['g','s','a','b'],
    help="filter by tier"
)

argstest = [
        "-n 3 -o a -w jboss lsoko -r g a",
        "-n 3 -o h v h -w jboss lsoko -r g a",
        "-n 3 -o h v h -w jboss,lsoko -r g a"
]

for a in argstest:
    try:
        print(parser.parse_args(shlex.split(a)))
    except:
        print("error with args:\n"+a)
    finally:
        print("="*70)

print(parser.print_help())
