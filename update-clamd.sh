#!/bin/bash

#Author:	Tien
#Purpose:	Configure Daily Scanning
#Create Date:	Tue May 24 10:40 AM

#Update ClamAV's signatures
/usr/bin/freshclam

#Configure daily scan
SCAN_DIR="/home"
LOG_FILE="/var/log/clamav/manual_clamscan.log"
/usr/bin/clamscan -i -r $SCAN_DIR >> $LOG_FILE
