#!/usr/bin/env bash

printf "\n  Supply the string to convert:\n\n"
read stringToConvert

if [ "$stringToConvert" = "" ]
then
  printf "\nThe input was empty! Try again if you want.\n\n"
else
  printf "\n\n  "
  echo "$stringToConvert" | awk '{print tolower($0)}'
  printf "\n\n"
fi
