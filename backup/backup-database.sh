#!/bin/bash

#Description: This script will be used to backup MySQL dump. Also it deletes the backup data older than 30 days.
#Time to run: Every day at 21:00 and 23:30
#Created:    : Tien
#Changelog   : 02/02/2015 - Maybe $_$
#            : 08/08/2015 - combine script by TienPhan remv_mysqldump & bk-database
#	     : 07/09/2016 - change path location backup from /opt to /home
#	     : 16/11/2016 - update '--host' & '--port' innobackupex

# Variable Declare
DAY=`/bin/date +%Y%m%d`
STORE="/home/backup/mysql"
filename=log_$DAY
log=$STORE/$filename

# Backup all database
innobackupex --slave-info --lock-wait-timeout=300 --user=root --password=Moc@579 --host=127.0.0.1 --port=3307 --defaults-file=/etc/my.cnf --stream=tar ./ | gzip -c -1  > /home/backup/mysql/s01.`date +%Y-%m-%d-%H%M`.tar.gz

# Remove the mysqldump older than 30 days
find $STORE -type f -daystart -mtime +18 -name "*.*" -print -delete | sed -e "s/^/$(date -R) /" >> $log


innobackupex --stream=xbstream --compress --user=root --password="yourpassword" --encrypt=AES256 --encrypt-key="somerandoomkey" /backup/automatic/daily/"$BACKUP_DATE" > /backup/automatic/daily/"$BACKUP_DATE"/"$BACKUP_DATETIME"_full-backup.xbstream  

$ innobackupex --decompress --decrypt=AES256 --encrypt-key="somerandoomkey" /restore_dir

for i in 2015-02-{01..28} 2015-{04,06,09,11}-{01..30} 2015-{01,03,05,07,08,10,12}-{01..31} …

