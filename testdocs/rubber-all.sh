#!/usr/bin/env bash
#
# Try rubber on our test documents.


for i in *; do
    if [[ -d $i ]]; then
        echo
        echo "Working in $i"
        cd $i
        rubber --pdf *.tex
        echo "rubber returned status code: $?"
        rm -f *.dvi *.ist *.idx *.ilg *.log *.ind *.aux *.aux *.out *.toc *.bbl *.blg *.glo *.nlo *.nav *.snm
        cd ..
    fi
done
