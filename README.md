sudo apt install guvcview ffmpeg gphoto2 v4l2loopback-dkms v4l2loopback-utils ffmpeg

sudo modprobe v4l2loopback
killall gvfs-gphoto2-volume-monitor

Plug in your camera via USB (when the camera mounts automatically, unmount it). Then run
gphoto2 --auto-detect  

This will create a video device in /dev/videoX(you may find video0, 1 and 2, just check wich one is the one you need), which you can now use in programs like VLC, OBS and others.

run this command to start capturing.
gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/videoX

If you see any errors about the device being in use you need to kill the gvfs-gphoto2-volume-monitor process by running killall gvfs-gphoto2-volume-monitor

and try again.

I'm usinf zenity to create a simple GUI to start and stop the video capturing.

![alt text](/screenShot.png)
