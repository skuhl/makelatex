#!/usr/bin/env bash

if [[ $1 == "pre" ]]; then
    echo "prepost.sh: Running script before document"
fi

if [[ $1 == "post" ]]; then
    echo "prepost.sh: Running script after document"
fi
