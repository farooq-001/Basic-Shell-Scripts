#!/bin/bash

# Function to compress files
compress_files() {
    # Check if the specified directory exists
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi

    # Go to the specified directory
    cd "$1" || exit

    # Loop through each file in the directory
    for file in *; do
        # Check if the file is a regular file (not a directory)
        if [ -f "$file" ]; then
            # Compress the file using tar and gzip
            tar -czvf "${file}.tar.gz" "$file"
        fi
    done
}

# Function to extract files
extract_files() {
    # Check if the specified directory exists
    if [ ! -d "$1" ]; then
        echo "Directory $1 does not exist."
        exit 1
    fi

    # Go to the specified directory
    cd "$1" || exit

    # Loop through each compressed file in the directory
    for file in *.tar.gz; do
        # Extract the file using tar
        tar -xzvf "$file" -C "$2"
    done
}

# Main script
while true; do
    echo "Select operation:"
    echo "1. Compress"
    echo "2. Extract"
    echo "3. Exit"
    read -rp "Enter choice: " choice

    case $choice in
        1)
            # Compress files
            read -rp "Enter directory to compress: " dir
            compress_files "$dir"
            ;;
        2)
            # Extract files
            read -rp "Enter directory to extract: " dir
            read -rp "Enter destination directory: " dest_dir
            extract_files "$dir" "$dest_dir"
            ;;
        3)
            # Exit
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a valid option."
            ;;
    esac
done

