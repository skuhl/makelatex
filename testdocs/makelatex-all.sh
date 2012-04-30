#!/usr/bin/env bash

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

