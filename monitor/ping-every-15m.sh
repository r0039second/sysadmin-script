#!/bin/bash

ip_address="192.168.200.156"
store="/opt/log"
time=$(date +%Y%m%d)
filename=vpn_vcb_$time.txt
log=$store/$filename

for ((n=0;n<11;n++))
do
	timestamp=$(date +%Y%m%d-%H:%M:%S)
	if ping -c 1 -W 1 "$ip_address"; then
		echo "$timestamp: $ip_address is alive" >> $log
		else
		echo -e "$ip_address is not pingable " | mail -r root@company.vn -s "VPN Tunnel VCB is down" monitor@company.vn
	#	echo -e "$timestamp: $ip_address is down. Will restart IPSEC service automatically" >> $log
		service ipsec restart
	fi
	sleep 5
done
