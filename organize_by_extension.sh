#!/bin/bash

# Get the script's directory
script_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
script_name="$(basename "$0")"  # Get the script's filename

# Loop through files in the script's directory, excluding the script and "sh"
for file in "$script_dir"/*; do
  if [[ -f "$file" && "$file" != "$script_name" && "$file" != "$script_dir/sh" ]]; then  # Check if it's a file, not the script, and not "sh"
    ext="${file##*.}"       # Extract the file extension

    # Create the directory if it's not "sh" and doesn't exist
    if [[ "$ext" != "sh" ]]; then
      dir="$script_dir/$ext"   # Create the directory name based on extension
      mkdir -p "$dir"
    fi

    # Move the file to its corresponding directory, skipping "sh"
    if [[ "$ext" != "sh" ]]; then
      mv "$file" "$dir"
    fi
  fi
done

echo "Files have been organized into directories based on their extensions."
