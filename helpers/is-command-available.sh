#!/bin/bash
#
#  Helper script to check for dependencies
#
#  This script can be placed in /usr/local/bin/
#
# script author: JacobSeated

#  |>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>|
#  |>>>>>>>Execute>>>>>>>>>>>>>>>>>>>>>>>>|
#  |>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>|

if [ "$1" = "" ]
then
 printf "\n Error: Missing required command line parameter: [command name]\n\n"
 exit 1
fi 

if [ ! -x "$(command -v $1)" ]
then
  printf "\n This script requires \"$1\" to be installed. Exiting.\n\n"
  # Exit with 2 = Missing keyword or command, or permission problem...
  # See also: http://www.tldp.org/LDP/abs/html/exitcodes.html
  # A zero code indicates success, while a value higher than zero indicates an error
  exit 2
fi