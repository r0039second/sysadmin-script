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
echo -e "\n"

# Check RAM and SWAP Usages
free -t -g | grep -v + > /tmp/ramcache
echo "Ram Usages :" $tecreset
cat /tmp/ramcache | grep -v "Swap" | grep -v "Total"
echo "Swap Usages :" $tecreset
cat /tmp/ramcache | grep -v "Mem" | grep -v "Total"
echo -e "\n"

# Check Disk Usages
df -h > /tmp/diskusage
echo "Disk Usages :" $tecreset 
cat /tmp/diskusage
echo -e "\n"

# Check Load Average
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo "Load Average :" $tecreset $loadaverage

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo "System Uptime Days/(HH:MM) :" $tecreset $tecuptime
echo -e "\n"

# Process running
processpass=$(ps aux | grep 'tomcat-[p]ass' | awk '{print $1,"\t",$2}')
processops=$(ps aux | grep 'tomcat-[o]ps' | awk '{print $1,"\t",$2}')
processmc=$(ps aux | grep 'tomcat-[m]c' | awk '{print $1,"\t",$2}')
processcms=$(ps aux | grep 'tomcat-[c]ms' | awk '{print $1,"\t",$2}')
processcrm=$(ps aux | grep 'tomcat-[c]rm' | awk '{print $1, "\t",$2}')
processmymoca=$(ps aux | grep 'tomcat-[m]ymoca' | awk '{print $1,"\t",$2}')
processbportal=$(ps aux | grep 'tomcat-[b]portal' | awk '{print $1,"\t",$2}')

echo "Process Running:"
echo -e "\t \t Name \t PID"
echo -e "$tecreset \t \t $processpass"
echo -e "$tecreset \t \t $processops"
echo -e "$tecreset \t \t $processcms"
echo -e "$tecreset \t \t $processmc"
echo -e "$tecreset \t \t $processcrm"
echo -e "$tecreset\t\t $processbportal"
echo -e "$tecreset\t\t $processmymoca"
echo -e "\n"

#VPN tunnel
processvpn=$(ps aux | grep '/usr/libexec/ipsec/pluto --nofork' | grep -v grep | awk '{print $1,"\t",$2}')
echo "IPsec VCB running:"
echo -e "$tecreset \t \t $processvpn"
echo -e "\n"

#Application status
echo "Application status?"
nginx=$(/etc/init.d/nginx status)
echo -e "\t \t $nginx"
haproxy=$(/etc/init.d/haproxy status)
echo -e "\t \t $haproxy"
mysql=$(/etc/init.d/mysqld status)
echo -e "\t \t $mysql"
postfix=$(/etc/init.d/postfix status)
echo -e "\t \t postfix $postfix"
