#!/bin/bash

# Read source directory path from user input
read -rp "Enter source directory path: " source_dir

# Check if the specified directory exists
if [ ! -d "$source_dir" ]; then
    echo "Directory $source_dir does not exist."
    exit 1
fi

# Go to the specified directory
cd "$source_dir" || exit

# Rename files with numeric names from 1 to 100
count=1
for file in *; do
    mv "$file" "${count}.jpg" && ((count++))
    [ $count -gt 100 ] && break
done
