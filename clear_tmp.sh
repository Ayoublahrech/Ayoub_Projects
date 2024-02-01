#!/bin/bash

# Define directory for temporary files (adjust as needed)
temp_dir="/tmp"

# List of file extensions to delete (add/remove as needed)
file_types="*.tmp *.log *.bak *.cache"

# Clean up temporary files
rm -rf "$temp_dir"/*$file_types

# Show a message confirming the cleaning
echo "Temporary files cleaned!"

# This line keeps the script window open (optional)
read -p "Press any key to close..."
