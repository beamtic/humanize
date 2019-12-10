#!/bin/bash
#
#  Wrapper for ln to create symbolic links
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

#  |>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>|
#  |>>>>>>>Execute>>>>>>>>>>>>>>>>>>>>>>>>|
#  |>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>|

printf "  The destination is the location that you want the link to point to (not the location of the link file).\n"
printf "  Type the destination File Path below:\e[1m\n"
# Read the user input, while allowing the user to use tab to complete paths (-e)
read -e userInput
printf "\e[m"
unfold_path
destinationFilePath=$unfoldedPath
printf "\n  Destination is: $destinationFilePath\n"

printf "\n  Where should the link be located (I.e.: ~/Desktop/Name-of-link):\e[1m\n"
read -e userInput
printf "\n \e[m"

unfold_path
sourceFilePath=$unfoldedPath
printf "\n  Link location is: $sourceFilePath\n"

# Run the ln command with the options for symbolic link creation
ln -s -T "$destinationFilePath" "$sourceFilePath"

if [ $? -eq 0 ]; then
    printf "\n Link created..\n"
else
    printf "\n Failed to create link..\n"
fi