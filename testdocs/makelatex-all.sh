#!/usr/bin/env bash

# Unset any environment variables:
unset MAKELATEX_ENGINE BIBINPUTS TEXINPUTS TEXINPUTS_NOTMP UCONVERT_SRC_DIR UCONVERT_DEST_DIR

# Make sure we use the right makelatex and uconvert
PATH="../..:${PATH}"

# Change 0 to 1 to test how makelatex acts when different programs are
# missing. NOTE: Using this can break the prepost.sh script and any number
# of other things.
if (( 0 )); then
    rm -rf temp-bin
    mkdir temp-bin
    # Needed to run:
    ln -s /usr/bin/python temp-bin
    ln -s /usr/bin/python3 temp-bin
    # Binaries used by other scripts (makeglossaries, etc)
    ln -s /usr/bin/dirname temp-bin
    ln -s /usr/bin/rm temp-bin
    ln -s /usr/bin/perl temp-bin
    ln -s /usr/bin/bash temp-bin
    ln -s /usr/bin/env temp-bin

    # Binaries used by makelatex makelatex:
    ln -s /usr/bin/touch temp-bin

    ln -s /usr/bin/latex temp-bin
    ln -s /usr/bin/dvips temp-bin
    ln -s /usr/bin/ps2pdf temp-bin
    ln -s /usr/bin/ps2pdf14 temp-bin
    ln -s /usr/bin/ps2pdfwr temp-bin
    ln -s /usr/bin/gs temp-bin

    ln -s /usr/bin/makeindex temp-bin
    ln -s /usr/bin/bibtex temp-bin
    ln -s /usr/bin/makeglossaries temp-bin

    ln -s /usr/bin/pdftk temp-bin
    ln -s /usr/bin/qpdf temp-bin

    PATH="../..:${PWD}/temp-bin"
fi


# kill the script entirely if ctrl+c is pressed
trap ctrl_c INT
function ctrl_c() { rm -rf temp-bin; exit; }

# Disable greyscale test since we are removing the feature for now.
# MLARGS="-q -o -f --screen --greyscale --nupHandout --nupPort 2x1"
MLARGS="-o -f --screen --nupHandout --nupPort 2x1"


for i in `ls | grep -v temp-bin`; do
	if [[ -d $i ]]; then
		echo
		echo "Working in $i"
		cd $i
		makelatex ${MLARGS}
		echo "makelatex returned status code: $?"
		echo
		echo "Working in $i using Python 3"
		# TODO: This doesn't force uconvert through Python 3.
		python3 ../../makelatex ${MLARGS}
        cd ..
    fi
done


echo "All of these tests function correctly on a Ubuntu 13.04 with texlive. If you see an error, it could be a bug or it could be a missing package/font on your machine."
