#!/bin/bash

#Description : This script will be used to backup HA-Proxy,Nginx configuration. Also it deletes the backup configuration older than 30 days. 
#Time to run : Every day at 01:00 AM 
#Created     : ToanNc
#Be continued: TienPhan
#Changelog   : 02/02/2015 - First Initial 
#            : 08/08/2015 - Combine script by TienPhan remv_dir & bk-configuration.
#  	     : 09/08/2015 - Compress Datadog & IPSec, Lsyncd configuration.
#	     : 07/09/2016 - Change path location backup from /opt to /home

# Variable Declare
DAY=`/bin/date +%Y%m%d`
STORE="/home/backup"
filename=log_$DAY
log=$STORE/$filename

# Create Folder
mkdir -p $STORE/$DAY
# Backup Nginx configuration
tar -cf $STORE/$DAY/nginx-config.tar /etc/nginx/. 
# Backup HAProxy configuration
tar -cf $STORE/$DAY/haproxy-cofig.tar /etc/haproxy/.
# Backup IPTable Configuration
tar -cf $STORE/$DAY/iptables.tar /etc/sysconfig/iptables
# Backup MySQL Configuration
tar -cf $STORE/$DAY/my.tar /etc/my.cnf
# Backup DataDog Configuration
tar -cf $STORE/$DAY/datadog.tar /etc/dd-agent/.
# Backup IPsec Configuration
tar -cf $STORE/$DAY/ipsec-config.tar /etc/ipsec*
# Backup Lsyncd Configuration
tar -cf $STORE/$DAY/lsyncd.tar /etc/lsyncd.conf
# Backup Mongodb
tar -cf $STORE/$DAY/mongodb.tar /etc/mongodb.conf
# Remove the backup configuration older than 30 days
find $STORE -type d -mtime +21 ! -path "./mysql/*" -print -exec rm -rf {} + | sed -e "s/^/$(date -R) /" >> $log
