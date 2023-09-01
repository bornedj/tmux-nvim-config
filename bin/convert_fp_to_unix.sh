#!/bin/bash

# Function to convert a single Windows file path to POSIX file path
convert_to_posix() {
   # Replace backslashes with forward slashes
   posix_path="${1//\\//}"

   # Replace spaces with '\ '
   posix_path="${posix_path// /\\ }"

   # replace the windows drive with WSL location
   if [[ $posix_path =~ ^([a-zA-Z]):/ ]]; then
       drive_letter="${BASH_REMATCH[1],,}" # Convert drive letter to lowercase
       posix_path="/mnt/$drive_letter${posix_path#?:}"
   fi

   # Replace other special characters with their escaped equivalents
   posix_path="${posix_path//\&/\&amp;}"
   posix_path="${posix_path//\!/\&excl;}"
   posix_path="${posix_path//\"/\&quot;}"
   posix_path="${posix_path//\#/\&num;}"
   posix_path="${posix_path//\$/\&#36;}"
   posix_path="${posix_path//\'/\&apos;}"
   posix_path="${posix_path//\(/\\(}"
   posix_path="${posix_path//\)/\\)}"
   posix_path="${posix_path//\`/\&#96;}"
   posix_path="${posix_path//\;/\\;}"
   posix_path="${posix_path//\*/\\*}"
   posix_path="${posix_path//\?/\\?}"
   posix_path="${posix_path//\[/\\[}"
   posix_path="${posix_path//\]/\\]}"
   posix_path="${posix_path//\\/\\\\}"

   echo "$posix_path"
}

# Main script
if [ $# -eq 0 ]; then
   echo "Usage: $0 [Windows File Path]"
   exit 1
fi

windows_path="$1"
posix_path=$(convert_to_posix "$windows_path")

echo "Windows File Path: $windows_path"
echo "POSIX File Path: $posix_path"
