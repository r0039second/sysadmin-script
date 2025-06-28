#!/bin/bash

#Author:	Tien Phan
#Purpose:	keep a live ACB connection
#Created Date:	Tue Mar 1 11:09 PM

host="172.31.0.221"
subject="Host: ACB is down"
store="/opt/log"
time=$(date +%Y%m%d_%H%M%S)
filename=vpn_acb_$time.txt
log=$store/$filename

for myhost in $host
do
	count=$(ping -c 30 $myhost | wc -l)
	if [ $count -eq "35" ]; then
		echo "Host: $myhost (ACB) is up"
	else
		echo "Host: $myhost is down (ping failed) at $(date)"
#		echo -e "Host: $myhost (ACB) is down. Afterward restart ipsec service" | mail -r root@company.vn -s "$subject" monitor@company.vn
		echo -e "Host: $myhost (ACB) is down. Afterward restart ipsec service" >> $log
		service ipsec restart 
	fi
done
