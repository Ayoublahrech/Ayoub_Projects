#!/bin/bash

# Function to prompt and validate user input
get_valid_path() {
  read -p "$1: " path
  while [ ! -d "$path" ]; do
    echo "Invalid path. Please enter a valid directory."
    read -p "$1: " path
  done
  echo "$path"
}

# Get search path
search_path=$(get_valid_path "Enter the path to search:")

# Get destination directory path
destination_dir=$(get_valid_path "Enter the path to create the destination directory:")

# Get desired directory name
read -p "Enter the name of the destination directory: " directory_name

# Create destination directory if it doesn't exist
if [ ! -d "$destination_dir/$directory_name" ]; then
  mkdir -p "$destination_dir/$directory_name"
fi

# Find PDF files and move them
find "$search_path" -name "*.pdf" -type f -exec mv {} "$destination_dir/$directory_name/" \;

echo "Successfully moved PDF files to '$destination_dir/$directory_name'."
