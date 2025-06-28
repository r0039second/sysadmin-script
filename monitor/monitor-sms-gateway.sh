#!/bin/bash

# Author:	Tien
# Date:		19 Jun 2017
# Version:	1.0	
# Purpose:	monitor sms connection
# man nc	single port: nc -zv 127.0.0.1 80
#		multiple ports: nc -zv 127.0.0.1 80 8080 22
#		range ports: nc -zv 127.0.0.1 80-90
#		nc 127.0.0.1 80 &> /dev/null; echo $? | output 0 if port 80 is open, and 1 if it is close

result=`cat /tmp/vmgsms`

nc -zv brandsms.vn 8018 > /tmp/vmgsms

if [ "$result" = "Connection to brandsms.vn 8018 port [tcp/*] succeeded!" ];
then
	echo -e "VMG sms is up"
else
	echo -e "VMG sms is down" | mail -r root@company.vn -s "VMG sms is down" monitor@company.vn
fi

