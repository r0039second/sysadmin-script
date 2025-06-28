#!/bin/bash

# Author:	Tien
# Date:		Don't remember
# Purpose: 	The wallpaper's going to change every 900 seconds.

while true; do
sleep 900
DIR="/home/tphanix/Pictures"
PIC=$(ls $DIR/* | shuf -n1)
DISPLAY=:0 gsettings set org.gnome.desktop.background picture-uri "file://$PIC" 
done
