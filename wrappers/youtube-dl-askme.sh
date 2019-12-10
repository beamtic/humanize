#!/bin/bash
#
#  youtube-dl wrapper script to simplify downing of Audio and Video from YouTube
#  Note. There are likely GUIs for youtube-dl which are better to use. Google "youtube-dl GUI"
#
# Script author: JacobSeated

echo "Supply the URL for the resource you want to download. I.e.: https://www.youtube.com/watch?v=[VIDEO_ID]"
read resourceURL

echo "what do you want to download? (V for video - A for audio)"
read videoAudio

# Check if Audio or Video was selected
# To keep things simple, mp3 is used for audio
if [ $videoAudio = 'A' ]
then
  youtube-dl --extract-audio --audio-format mp3 $resourceURL
elif [ $videoAudio = 'V' ]
then
  youtube-dl $resourceURL 
fi