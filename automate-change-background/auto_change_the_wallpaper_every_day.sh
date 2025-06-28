#!/bin/bash

#author: Tien Phan
#date: Wed Dec 9 10:36 AM 2015
#why? I write this script to automate the change of wallpaper every day. In fact, I always change wallpaper every day; I do not like a fixed wallpaper. It is not interesting. So I do it.
#shuf command: generate random permutations of the input lines to standard output.
#shuf -n, --head-count=COUNT: output at most COUNT lines. Print a random word in LINUX/UNIX

DIR="/home/tphanix/Pictures"
PIC=$(ls $DIR/* | sort -n | shuf -n1) 
#PIC=$(ls $DIR/* | head -n 1)
#PIC=$(ls $DIR/* | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$PIC"

#Think Different
#DIR="/home/tphanix/Pictures/"
#ls -1 -c $DIR | xargs `gsettings set org.gnome.desktop.background picture-uri "file://$DIR"`
