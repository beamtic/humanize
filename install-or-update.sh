#!/bin/sh

printf "\n  \e[0;33m \e[1m Project humanize \e[0;33m"

printf  "\n\n Warning: This script will install or update the humanize command wrappers\n"
printf  "          You should manually install Python. I.e.: \e[1m apt get install Python \e[m"

printf "\n\n  The wrappers will be copied to:\e[1m /usr/local/bin/ \e[m"
printf "\n  which will make them callable from any location."

printf "\n\n  \e[1m Note.:\e[m If a wrapper script depends on Python or other programs,"
printf "\n          you will be informed when trying to run the script.\n\n"

printf " Do you want to continiue? (y/n) \e[1m \n"
read userInput

printf "\e[m"

if [ "$userInput" = "y" ]
then
  # Save the script path for later use
  script_dir=$(dirname "$(readlink -f "$0")")

  # printf "\n  Attempting to copy files...  \n\n"
  sudo cp -u "$script_dir/wrappers/"* "/usr/local/bin/"

  if [ $? -eq 1 ]; then
    printf "\n Failed to copy wrapper scripts... Exiting... \n\n"
    exit 1
  fi

  sudo cp -u "$script_dir/helpers/"* "/usr/local/bin/"

  if [ $? -eq 1 ]; then
    printf "\n Failed to copy helper scripts, but the wrappers got copied successfully...\n\n"
    exit 1
  else 
    printf "\n humanize scripts successfully updated/installed\n\n"
    exit
  fi
  
  
else 
  printf "  Okay. Bist ein Clown? yes or no?... \e[1m \n"
  read userInput
  printf "\e[m"
  if [ "$userInput" = "yes" ]
  then
    printf "\n Clowning around is your right.\n\n"
  elif [ "$userInput" = "no" ]
  then
    printf "\n Understood. You try again later.\n\n"
  fi
fi