#!/bin/bash

#Description: this script will be used to change permission of DAT file in "/home/banks/vpbank/DOWNLOAD".
#Reason     : DAT file write with 600 attribute. So sftp account could not download via sftp. Developer do not know exactly how to find & fix it in code, so I decide to write this script. Do it for me, for user usability.
#Time to run: Every day at 07:00 AM
#Created by : TienPhan
#Changelog: : 23/09/2015 - First initial

#Variable Declare
timestamp=$(date +%Y%m%d_%H%M%S)
path="/home/banks/vpbank/DOWNLOAD/"
filename=log_vpbankchmod_$timestamp.txt
log=/opt/log/$filename

#find $path -type f -name '*.dat' -o -name '*.csv' -daystart -ctime 0 -print -exec chmod 644 {} + | sed -e "s/^/$(date -R) /" >> $log
find $path -type f \( -iname \*.dat -o -iname \*.csv \) -daystart -ctime 0 -print -exec chmod 644 {} + | sed -e "s/^/$(date -R) /" >> $log
