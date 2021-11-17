#!/bin/bash

sudo modprobe v4l2loopback


gphoto2 --auto-detect
echo "_____________________________________________________________________"

gphoto2 --abilities
echo "_____________________________________________________________________"

