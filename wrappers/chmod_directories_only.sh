#!/bin/bash

# Function to "unfold" the tilde "~" character so it correctly points
# to the users home directory. I.e.: /home/MyUser/
unfold_path () {
  unfoldedPath=$(python -c "import os.path;print os.path.expanduser(\"$userInput\")")
}

# Instead of allowing parameters (which needs to work like parameters for normal chmod)
# lets just ask the user
printf "Supply a path for a directory I.e.: /var/www/site_directory\n"
read -e userInput

unfold_path
printf "\n Destination: $unfoldedPath\n\n"
path=$unfoldedPath

printf "What should permissions be? I.e. 644 for files, and 755 for directories.\n"
printf "This action will also apply to subdirectories!\n\n"
printf "  7: read, write and execute (rwx)\n"
printf "  6: read and write (rw-)\n"
printf "  5: read and execute (r-x)\n"
printf "  4: read only (r--)\n"
printf "  3: write and execute (-wx)\n"
printf "  2: write only (--x)\n"
printf "  1: execute only (--)\n"
printf "  0: none (---)\n:\n"
read permissions

find $path -type d -print0|xargs -0 chmod $permissions
