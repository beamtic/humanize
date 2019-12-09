#!/bin/bash
# youtube-dl Script that will ask the user what to download
# Note. There are likely GUIs for youtube-dl which are better to use. Google "youtube-dl GUI"
# Script by JacobSeated

echo "Supply the URL for the resource you want to download. I.e.: https://www.youtube.com/watch?v=[VIDEO_ID]"
read resourceURL

echo "what do you want to download? (V for video - A for audio)"
read videoAudio

if [ $videoAudio = 'A' ]
then
  youtube-dl --extract-audio --audio-format mp3 $resourceURL
elif [ $videoAudio = 'V' ]
then
  youtube-dl $resourceURL 
fi
