#!/bin/bash
#
#  Wrapper for ln to create symbolic links
#
#  This script can be placed in /usr/local/bin/
#
# script author: JacobSeated

# Function to "unfold" the tilde "~" character so it correctly points
# to the users home directory. I.e.: /home/MyUser/
unfold_path () {
  unfoldTilde=~
  unfoldedPath="${stringInput/\~/$unfoldTilde}"
}

printf "  The destination is the location that you want the link to point to (not the location of the link file).\n"
printf "  Type the destination File Path below:\n\n"
# Read the user input, while allowing the user to use tab to complete paths (-e)
read -e stringInput
unfold_path
destinationFilePath=$unfoldedPath

printf "\n  Type The File Path for the location of the link,"
printf "\n  including the file name of the link:\n\n"
read -e stringInput

unfold_path
sourceFilePath=$unfoldedPath

# Run the ln command with the options for symbolic link creation
ln -s -T "$destinationFilePath" "$sourceFilePath"