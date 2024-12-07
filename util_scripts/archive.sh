#!/bin/bash

# 20241206-ish Copilot & fekerr
# super dumb script to archive a file while working with copilot

# Function to archive a file
archive_file() {
    local file="$1"
    local base="${file%.*}"
    local ext="${file##*.}"
    local counter=1

    if [[ "$base" == "$ext" ]]; then
        ext=""
    else
        ext=".$ext"
    fi

    # Check if the file already has a trailing 3-digit number
    if [[ "$base" =~ _[0-9]{3}$ ]]; then
        base="${base%_[0-9]{3}}"
    fi

    # Find the next available incrementing number
    while [ -f "_${base}$(printf '%03d' $counter)$ext" ]; do
        ((counter++))
    done

    mv "$file" "_${base}$(printf '%03d' $counter)$ext"
    echo "Archived $file as _${base}$(printf '%03d' $counter)$ext"
}

# Check if the script is given a filename
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

archive_file "$1"

