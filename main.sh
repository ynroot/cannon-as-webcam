#!/bin/bash


rc=1 # OK button return code =0 , all others =1
while [ $rc -eq 1 ]; do
  ans=$(zenity --info --title 'YNROOT TEST' --window-icon='/images/logo.png' \
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
        sudo modprobe v4l2loopback

        gphoto2 --auto-detect
        echo "_____________________________________________________________________"

        gphoto2 --abilities
        echo "_____________________________________________________________________"
        sleep 2

        gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2

  elif [[ $ans = "STOP" ]]
  then
        echo "cmd 3"
        killall gphoto2 gvfs-gphoto2-volume-monitor
  fi
done
