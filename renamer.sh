#!/bin/bash

# Prompt the user for the desired file extension
read -p "Enter the file extension you want to rename (e.g., nes or mp3): " extension

# Find files with the specified extension and rename them
find . -type f -name "*.$extension" -print0 | while read -r -d '' line; do
    new_name=$(sed -E 's!(.*)/[^[:alpha:]]*([[:alpha:]].*'$extension')$!\1/\2!' <<<"$line")
    mv "$line" "$new_name" 2>/dev/null
done

echo "Files with .$extension extension have been renamed."

