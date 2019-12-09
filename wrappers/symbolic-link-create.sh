#!/bin/bash
#
#  Wrapper for ln to create symbolic links
#
#  This script can be placed in /usr/local/bin/
#
# script author: JacobSeated

unfold_path () {
  unfoldTilde=~
  unfoldedPath="${stringInput/\~/$unfoldTilde}"
}

printf "  The destination is the location that you want the link to point to (not the location of the link file).\n"
printf "  Type the destination File Path below:\n\n"
read -e stringInput
unfold_path
destinationFilePath=$unfoldedPath

printf "\n  Type The File Path for the location of the link,"
printf "\n  including the file name of the link:\n\n"
read -e stringInput

unfold_path
sourceFilePath=$unfoldedPath

ln -s -T "$destinationFilePath" "$sourceFilePath"