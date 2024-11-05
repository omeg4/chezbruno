#!/bin/zsh
#

NFEH=1
FDIR='/mnt/sgext/allpics/scmd/'

VERTARG="\( -not -iregex ".*ar.vert.*" \)"
FNAME=()

for ARG in "$@"; do
  case $ARG in
    -d=*)
      DIR=${ARG#*=}
      case $DIR in
        v)
          FDIR='/mnt/sgext/allpics/vgcaps/'
          ;;
        s)
          FDIR='/mnt/sgext/allpics/scmd/'
          ;;
      esac
      ;;
    -n=*)
      NFEH=${ARG#*=}
      ;;
    -p=*)
      FNAMES+=${ARG#*=}
      ;;
    -r=*)
      RANK=${ARG#*=}
      RANK=${RANK//d/(god)}
      RANKARG="-iregex \".*[$RANK]tier.*\""
      ;;
    -v)
      VERTARG="\( -iregex \".*vert-vid.*\" -o -iregex \".*ar-vert.*\" \)"
      ;;
  esac
done

FARG=()
for FNAME in "${FNAMES[@]}"; do
  FARG+=\( -iregex \".*$FNAME.*\" \)
done

PTRN='-iregex ".*vert.*" \( -regex ".*tag.*" -o -iregex ".*godtier.*" -o -iregex ".*stier.*" \) \( -iregex ".*jpg" -o -iregex ".*png" \)'

for n in {1..4}; do
  eval "find /mnt/sgext/allpics/scmd/ -maxdepth 1 -type f $PTRN -exec feh -Tslides {} +" > /dev/null 2>&1 &
done
eval "find /mnt/sgext/allpics/scmd -maxdepth 1 -type f -iregex \".*notch.*\" $PTRN -exec feh -Tslides {} +" > /dev/null 2>&1 &
