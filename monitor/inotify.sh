#!/bin/bash

#Author:	Tien
#Reason:	monitor adding/updating/removing files by inotify
#Change log:	0.1

#INSTALL
#[root@s06 script]# yum install inotify-tools.x86_64

inotifywait -e create,delete -mrq /opt/script
