#!/usr/bin/env bash

# Unset any environment variables:
unset MAKELATEX_ENGINE BIBINPUTS TEXINPUTS TEXINPUTS_NOTMP UCONVERT_SRC_DIR UCONVERT_DEST_DIR

PATH="../..:$PATH"

# kill the script entirely if ctrl+c is pressed
trap ctrl_c INT
function ctrl_c() { exit; }

for i in *; do
    if [[ -d $i ]]; then
        echo
        echo "Working in $i"
        cd $i
        makelatex -q -o -f --screen --greyscale --nupHandout --nupPort 2x1
        echo "makelatex returned status code: $?"
        cd ..
    fi
done


echo "All of these tests function correctly on a Ubuntu 12.04 with texlive-backports (2011) installed. Although, if you see an error, it could be a problem or it could be a missing package/font on your machine."
