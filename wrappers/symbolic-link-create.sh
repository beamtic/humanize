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
if [ ! -x "$(command -v python)" ]
then
  printf 'This script requires Python to be installed. Exiting.'
  # Exit with 2 = Missing keyword or command, or permission problem...
  # See also: http://www.tldp.org/LDP/abs/html/exitcodes.html
  # A zero code indicates success, while a value higher than zero indicates an error
  exit 2
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