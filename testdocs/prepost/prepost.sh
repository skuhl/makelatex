#!/usr/bin/env bash

if [[ $1 == "pre" ]]; then
    echo "prepost.sh: Running script before document"
elif [[ $1 == "post" ]]; then
    echo "prepost.sh: Running script after document"
elif [[ $1 == "interrupt" ]]; then
    echo "prepost.sh: Running script because we were interrupted"
else
    echo "prepost.sh: Unhandled parameter $1"
fi
