#!/bin/bash

# Author:	Tien
# Date:		26 May 2017
# Version:	1.0	
# Purpose:	monitor cgate status

result=`cat /tmp/cgate`

cd /home/pass/corex/api-gateway/bin
./api_gateway ping > /tmp/cgate

if [ "$result" = "pong" ];
then
	echo -e "cgate is up"
else
	echo -e "cgate is down" | mail -r root@company.vn -s "cgate is down" monitor@company.vn
fi
