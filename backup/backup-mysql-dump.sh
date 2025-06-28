#!/bin/bash

# Author:	Tien
# Date:		15/11/2016
# Purpose:	Automatically backup MySQL everyday
# Note:		To ignore a single view:
#		mysqldump --user= --password= --host -P --ignore-table=db.view_name
#		Extract file.gz: gunzip file.gz | gzip -d file.gz

# Database credentials
user="root"
passwd=`cat /etc/mysql-passwd`
host="127.0.0.1"

# Other options
backup_path="/home/backup/mysqldump"
date=$(date +"%Y-%m-%d-%H%M")

# Set default file permission
umask 177

# Dump database into SQL file. Afterthat compress with tar
mysqldump --host=$host -P 3307 --routines=true --user=$user --password=$passwd bank-portal | gzip > $backup_path/bank-portal-$date.sql.gz
sleep 5m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd moca-cms | gzip > $backup_path/moca-cms-$date.sql.gz
sleep 5m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd bank-portal | gzip > $backup_path/bank-portal-$date.sql.gz
sleep 5m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd crm | gzip > $backup_path/crm-$date.sql.gz
sleep 5m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd data-warehouse | gzip > $backup_path/data-warehouse-$date.sql.gz
sleep 10m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd merchant-mc | gzip > $backup_path/merchant-mc-$date.sql.gz
sleep 10m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd my-moca | gzip > $backup_path/my-moca-$date.sql.gz
sleep 5m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd ops-portal | gzip > $backup_path/ops-portal-$date.sql.gz
sleep 10m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd token-vault | gzip > $backup_path/token-vault-$date.sql.gz
sleep 10m
mysqldump --host=$host -P 3307 --user=$user --password=$passwd moca-pass | gzip > $backup_path/moca-pass-$date.sql.gz
sleep 30m
#mysqldump --host=$host -P 3307 --user=$user --password=$passwd big-data | gzip > $backup_path/big-data-$date.sql.gz

# Delete files older than 30 days
find $backup_path/* -mtime +30 -exec rm {} \;
