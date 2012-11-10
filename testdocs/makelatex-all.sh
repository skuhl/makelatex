#!/usr/bin/env bash

# Unset any environment variables:
unset MAKELATEX_ENGINE BIBINPUTS TEXINPUTS TEXINPUTS_NOTMP UCONVERT_SRC_DIR UCONVERT_DEST_DIR

# Make sure we use the right makelatex and uconvert
PATH="../..:$PATH"

# kill the script entirely if ctrl+c is pressed
trap ctrl_c INT
function ctrl_c() { exit; }

# Disable greyscale test since we are removing the feature for now.
# MLARGS="-q -o -f --screen --greyscale --nupHandout --nupPort 2x1"
MLARGS="-q -o -f --screen --nupHandout --nupPort 2x1"


for i in *; do
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


echo "All of these tests function correctly on a Ubuntu 12.04 with texlive-backports (2012) installed. If you see an error, it could be a bug or it could be a missing package/font on your machine."
