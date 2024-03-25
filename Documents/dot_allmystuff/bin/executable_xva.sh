#!/bin/zsh

find /mnt/sgext/stuff \( \
	\( -iregex ".*godtier.*" -o -iregex ".*stier.*" -o -iregex ".*atier.*" -o -iregex ".*votd.*" -o -iregex ".*send.?it.*" \) -a \( \
		-iregex ".*ffm.*" -o -iregex ".*fmm.*" -o -iregex ".*lingerie.*" -o -iregex ".*proam.*" \
		\) \
	\) -o \( \
		-iregex ".*ava.dal.*" -o \
		-iregex ".*aidra.fox.*" -o \
		-iregex ".*ariana.marie.*" -o \
		-iregex ".*lexi.luna.*" -o \
		-iregex ".*eliza.ibarra.*" -o \
		-iregex ".*savannah.six.*" -o \
		-iregex ".*bunny.colby.*" -o \
		-iregex ".*young.dev.*" -o \
		-iregex ".*elena.grim.*" -o \
		-iregex ".*stacy.cruz.*" -o \
		-iregex ".*liya.silv.*" -o \
		-iregex ".*vicky.love.*" -o \
		-iregex ".*tiffany.th?omp.*" -o \
		-iregex ".*maryjane.john.*" -o \
		-iregex ".*gina.valen.*" -o \
		-iregex ".*veronica.rod.*" -o \
		-iregex ".*clea.gaultier.*" -o \
		-iregex ".*capri.cav.*" -o \
		-iregex ".*april.o.?neil.*" -o \
		-iregex ".*whitney.west.*" -o \
		-iregex ".*teal.conrad.*" -o \
		-iregex ".*ashley.adams.*" -o \
		-iregex ".*molly.jane.*" -o \
		-iregex ".*victoria.rae.*" -o \
		-iregex ".*sofia.[gc]ucci.*" -o \
		-iregex ".*gianna.dior.*" -o \
		-iregex ".*anjelica.ebbi.*" -o \
		-iregex ".*krystal.boyd.*" -o \
		-iregex ".*red.fox.*" -o \
		-iregex ".*rahyndee.ja.*" -o \
		-iregex ".*britney.amber.*" -o \
		-iregex ".*emily.willis.*" -o \
		-iregex ".*karla.kush.*" -o \
		-iregex ".*melissa.moore.*" -o \
		-iregex ".*dilli?on.harp.*" -o \
		-iregex ".*mia.malko.*" -o \
		-iregex ".*dani.daniels.*" -o \
		-iregex ".*holly.michaels.*" -o \
		-iregex ".*eva.lovia.*" -o \
		-iregex ".*leah.gotti.*" -o \
		-iregex ".*lacy.lennon.*" -o \
		-iregex ".*brenna.sparks.*" -o \
		-iregex ".*tori.black.*" -o \
		-iregex ".*jaye.summers.*" -o \
		-iregex ".*valentina.nappi.*" -o \
		-iregex ".*natalia.starr.*" -o \
		-iregex ".*natasha.starr.*" -o \
		-iregex ".*bailey.brooke.*" -o \
		-iregex ".*lana.rhoades.*" -o \
		-iregex ".*taylor.sands.*" -o \
		-iregex ".*casey.calvert.*" -o \
		-iregex ".*darci[ae].lee.*" -o \
		-iregex ".*nicole.bexley.*" -o \
		-iregex ".*lolly.lips.*" -o \
		-iregex ".*kriss.kiss.*" -o \
		-iregex ".*jade.nile.*" -o \
		-iregex ".*adria.rae.*" -o \
		-iregex ".*samantha.saint.*" -o \
		-iregex ".*kagney.l[yi]nn.*" \
	\) \
	-not -iregex ".*vert-vid.*" \
	-exec mpv --profile=pron '{}' +
