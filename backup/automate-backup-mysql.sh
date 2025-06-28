#!/bin/bash
# Author:        Tien
# Date Created:  07/11/2016
# Why:           Dump all databases for backup
# Change logs:   0.1 the first version

### SFTP SERVER Login info ###
USER="FTP-SERVER-USER-NAME"
PASSWD="FTP-SERVER-PASSWORD"
IP="FTP-SERVER-IP-ADDRESS"
NOW=$(date +"%d-%m-%Y")

### MYSQL BACKUP Location ###
PATH="/home/backup/mysql"

# 1.Dumpdb
mysqldump -h 127.0.0.1 -P 3307 --routines -uroot -pMoc@579 merchant-mc > $PATH/merchant-mc.sql.`date +%Y-%m-%d-%H%M`a.gz

# 2.Upload to SFTP server
#lftp -u $FTPU,$FTPP -e "mkdir /mysql/$NOW;cd /mysql/$NOW; mput /backup/mysql/*; quit" $FTPS


