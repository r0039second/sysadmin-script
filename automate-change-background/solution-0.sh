#!/bin/bash

#dir="/home/tphanix/Pictures"
#for change in `ls $dir/* | sort -n | head -4`; do gsettings set org.gnome.desktop.background picture-uri "file://$change"; done

while true; do
sleep 1800
DIR="/home/tphanix/Pictures"
PIC=$(ls $DIR/* | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$PIC" 
done
