#!/usr/bin/env bash

# noembed uses the "times" package which means that we don't have to embed
# it since "Times" is one fo the default PDF fonts.
NAME=noembed-type1
latex ${NAME}
dvips -V -f -o ${NAME}.ps < ${NAME}.dvi
# screen defaults to no font embedding
ps2pdf -dPDFSETTINGS=/screen ${NAME}.ps ${NAME}.pdf
pdfcrop --margins 5 ${NAME}.pdf ${NAME}-crop.pdf
mv ${NAME}-crop.pdf ${NAME}.pdf
rm ${NAME}.log ${NAME}.aux ${NAME}.dvi ${NAME}.ps


# embed uses the computer modern typeface. dvips -V indicates that bitmaps
# should be used for non-resident postscript fonts.
makelatex embed-type1
pdfcrop --margins 5 embed-type1.pdf embed-type1-crop.pdf
mv embed-type1-crop.pdf embed-type1.pdf


NAME=embed-type3
latex ${NAME}
dvips -V -f -o ${NAME}.ps < ${NAME}.dvi
ps2pdf -dPDFSETTINGS=/screen ${NAME}.ps ${NAME}.pdf
pdfcrop --margins 5 ${NAME}.pdf ${NAME}-crop.pdf
mv ${NAME}-crop.pdf ${NAME}.pdf
rm ${NAME}.log ${NAME}.aux ${NAME}.dvi ${NAME}.ps

