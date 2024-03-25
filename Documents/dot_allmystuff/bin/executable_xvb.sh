#!/bin/zsh

find "/mnt/sgext/stuff" \( \
	-iregex ".*atier.*" -o \
	-iregex ".*stier.*" -o \
	-iregex ".*godtier.*" -o \
	-iregex ".*classic.*" -o \
	-iregex ".*votd.*" -o \
	-iregex ".*send.?it.*" -o \
	-iregex ".*lingerie.*" -o \
	-iregex ".*thong.bj.*" -o \
	-iregex ".*whales?.?tail.*" -o \
	-iregex ".*ffm.*" -o \
	-iregex ".*fmm.*" \) \
	-not -iregex ".*vert.vid.*" \
	-exec mpv --profile=pron {} +
