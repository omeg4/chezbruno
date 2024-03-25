#! /bin/zsh
#

#O $1.{jpg,jpeg,png}  -- works for $1 ~ '*substring*'
#						but not for $1 ~ '*{substr1,substr2}*'
#X *{$1}*.{jpg,jpeg,png}

# WORKS for '*godtier*' but not for '*{one,two}*'
# also works: \*godtier\*
# feh -. -L '%w %h %f' $1.{jpg,jpeg,png} | awk '{ if ($1 < $2) { print $0 } }' | cut -d ' ' -f 3- | feh -Tslides -f -

# NOX='*{'"$1"'}*'
# eval "ls /mnt/sgext/allpics/scmd/*{$1}* | wc -l"
# eval "ls /mnt/sgext/allpics/scmd/*{$1}*.{jpg,png} | wc -l"
ARG=$1

# feh -. -L '%w %h %f' *{$NOX}* | awk '{ if ($1 < $2) { print $0 } }' | cut -d ' ' -f 3- | feh -Tslides -f -
eval "feh -. -L '%w %h %f' *{vert,$ARG}* | awk '{ if (\$1 < \$2) { print \$0 } }' | cut -d ' ' -f 3- | feh -Tslides -f -"
