#!/usr/bin/python
#
import sys
import datetime

template = """# {date}

## Daily checklist

* [ ] Do work!
    ** [ ] Dissertation
    ** [ ] Phos Paper
* [ ] Be a human!
    ** [ ] Eat real food
    ** [ ] Brush teeth

## Keep track
    * P-count:
    **
    * C-count:
    **

## TODO:

## NOTES:

"""

data = (datetime.date.today() if len(sys.argv) < 2
        # Expecting filename in YYYY-MM-DD.foo format
        else sys.argv[1].rsplit(".",1)[0])
print(template.format(date=date))
