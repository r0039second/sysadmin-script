#!/bin/bash

# Author:	Tien
# Date:		25/11/2016
# Purpose:	The Ping bash script will send an email when ping cannot reach its destination

HOST="192.168.200.156"

for myHost in $HOST
do
ping -c 4 $myHost &> /dev/null

if [ $? -ne 0 ];then
	echo "`date`: ping failed, $myHost host is down" | mail -s "$myHost host is down" monitor@company.vn
fi
done
