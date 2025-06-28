#!/bin/bash

# Start ntpd if it's not already running
if ps aux | grep -v grep | grep "[n]tpd" > /dev/null
then
	echo "ntpd us running" > /dev/null
else
	/sbin/service ntpd restart > /dev/null
	echo "Started ntpd"
fi
# Make sure ntpd is enabled on system startup
chkconfig ntpd on

