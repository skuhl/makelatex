#!/usr/bin/env bash

PATH="../..:$PATH"

for i in *; do
    if [[ -d $i ]]; then
        echo
        echo "Working in $i"
        cd $i
        makelatex -c
        cd ..
    fi
done
