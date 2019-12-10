#!/bin/bash
#
#  Wrapper for mv to move files
#
#  This script can be placed in /usr/local/bin/
#
# script author: JacobSeated

#  |======================================|
#  |=======Dependencies===================|
#  |======================================|
# This assumes that "is-command-available.sh" is available on the system
is-command-available.sh "python"
if [ ! $? -eq 0 ]; then
    # Exit with the exit code of the script we just ran
    exit
fi

#  |======================================|
#  |=======Functions======================|
#  |======================================|

# Function to "unfold" the tilde "~" character so it correctly points
# to the users home directory. I.e.: /home/MyUser/
unfold_path () {
  unfoldedPath=$(python -c "import os.path;print os.path.expanduser(\"$userInput\")")
}

printf "\n  What do you want to move?\e[1m\n"
read -e userInput
printf "\e[m"

unfold_path
printf "\n Content to be moved: $unfoldedPath\n"
toBeMoved=$unfoldedPath

printf "\n  Where do you want to move it? Valid examples:\n"
printf " 1: \e[32m~/Documents/new-file-name.txt\e[m  or  \e[32m~/Documents/new-dir-name\e[m \n"
printf "   Keep the original name, just move the content to another location:\n"
printf " 2: \e[32m~/Documents/\e[m\n"
printf "\e[1m"
read -e userInput
printf "\e[m"

unfold_path
printf "\n Destination: $unfoldedPath\n"
destinationPath=$unfoldedPath

# Trying to move it
mv "$toBeMoved" "$destinationPath"

if [ $? -eq 0 ]; then
    printf "\n The content was moved..\n"
else
    printf "\n Failed to move the content..\n"
fi
