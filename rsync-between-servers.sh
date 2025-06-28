#!/bin/bash

#rsync the data between servers. 
#Option '-u' '--update' to skip any files for which the destination file already exists and has a date later than the source file.
#Option '--ignore-existing to skip all files that already exist in the destination

timestamp=$(date +%Y%m%d_%H%M%S)
path="/opt/backup"
filename=log_$timestamp.txt
log=$path/$filename

rsync --exclude '*.txt' --ignore-existing -arz $path --log-file=$log -e "ssh -p 65535" s02:/opt/backup/s01/
