#!/bin/bash

# Author:	Tien
# Date:		15/11/2016
# Purpose:	Automatically sync Application Configuration, MySQL's backup from s01 to s02

#rsync --ignore-existing -arz /home/backup/mysql s02:/home/backup
#rsync --ignore-existing -arz /home/backup/mysqldump s02:/home/backup
rsync --ignore-existing -arz /home/backup/ s02:/home/backup
