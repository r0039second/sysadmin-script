#!/bin/bash

# Check hostname
echo "Hostname :" $tecreset $HOSTNAME

# Check Internal IP
internalip=$(hostname -I)
echo "Internal IP :" $tecreset $internalip

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo "External IP : $tecreset "$externalip

# Check Logged In Users
who>/tmp/who
echo "Logged In users :" $tecreset && cat /tmp/who

# Check RAM and SWAP Usages
free -h | grep -v + > /tmp/ramcache
echo "Ram Usages :" $tecreset
cat /tmp/ramcache | grep -v "Swap"
echo "Swap Usages :" $tecreset
cat /tmp/ramcache | grep -v "Mem"

# Check Disk Usages
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo "Disk Usages :" $tecreset 
cat /tmp/diskusage

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo "Load Average :" $tecreset $loadaverage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo "System Uptime Days/(HH:MM) :" $tecreset $tecuptime

