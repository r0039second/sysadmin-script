#!/bin/bash

# Author:	  Tien
# Date:		  Don't remember
# Purpose: 	Script checks the network latency via the ping method. It sends the result of the ping to the log file.

while true; do
	ping -w 3600 s06.moca.vn |
	ts '%Y-%m-%d %H:%M:%S |' |
	tee -i -a /home/cattek/Scripts/Logs/ping.log
done

# Cut line time= * ms to get number greater than 20
#	cut -d' ' -f10 ping.log
