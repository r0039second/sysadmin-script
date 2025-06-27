#!/bin/bash

# Author:       Tien
# Date:         15/11/2016
# Purpose:      Automatically backup MySQL every day
# Note:         To ignore a single view:
#               mysqldump --user= --password= --host -P --ignore-table=db.view_name

# Database credentials
user="root"
passwd=`cat /etc/mysql-passwd`
host="127.0.0.1"

# Other options
backup_path="/home/backup/mysql"
date=$(date +"%Y-%m-%d-%H%M")

# Set default file permission
umask 177

mysqldump --host=$host -P 3307 --user=$user --password=$passwd bank-portal > $backup_path/bank-portal.sql
cd $backup_path
tar -cvzf bank-portal.$date.tar.gz bank-portal.sql
rm -rf bank-portal.sql

# Delete files older than 30 days
find $backup_path/* -mtime +30 -exec rm {} \;

