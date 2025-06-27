#!/bin/bash

# Author: 	Tien
# Date:		  15/12/2016
# Purpose:	Automatically run the port forwarding to VCB via the production server


NETSTAT=`netstat -taln | grep 9999 | grep LISTEN | wc -l`
SUBJECT="Port Forwarding on DEV01 is DOWN"

if [ "$NETSTAT" -ge "1" ];
then
  echo -e "Port Forwarding on DEV01 is UP"
else
  echo -e "Port Forwarding on DEV01 is DOWN"
fi

#ssh -L \*:9999:192.168.200.156:443 s01
