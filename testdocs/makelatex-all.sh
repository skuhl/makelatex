#!/usr/bin/env bash

PATH="../..:$PATH"

for i in *; do
    if [[ -d $i ]]; then
        echo
        echo "Working in $i"
        cd $i
        makelatex -o -f --screen --greyscale --nupHandout --nupPort 2x1
        echo "makelatex returned status code: $?"
        cd ..
    fi
done

