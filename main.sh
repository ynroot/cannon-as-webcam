#!/bin/bash


rc=1 # OK button return code =0 , all others =1
while [ $rc -eq 1 ]; do
  ans=$(zenity --info --title 'YNROOT TEST' --window-icon='' \
       --text 'Webcam CTRL' \
      --extra-button START \
      --extra-button STOP \
      --ok-label Quit \
 #     --extra-button cmd_four \
       )
  rc=$?
  echo "${rc}-${ans}"
  echo $ans
  if [[ $ans = "START" ]]
  then
        echo "Starting connection to the camera!"
        gnome-terminal -- './connect_link.sh'
  elif [[ $ans = "STOP" ]]
  then
        echo "cmd 3"
        gnome-terminal -- './stop_link.sh'
  fi
done
