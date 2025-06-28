#!/bin/bash

#Author:	Tien
#Date:		14/03/2016
#Purpose:	Automated-self correction attempt
#Version:	0.1 grep process to know the status's tomcat application. If it is not running, then script is going to start it.

###CMS
CMS=$(ps aux | grep 'tomcat-[c]ms/conf' | awk '{print $1,"\t",$2}' | wc -l)
RCMS=`CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=7201 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false" CATALINA_BASE=/home/cms/tomcat-cms /opt/tomcat/bin/startup.sh`

if [ "$CMS" -eq "1" ];
then
	echo "cms is running ..."
else
	echo "$RCMS"
	echo -e "restarting cms at $(date)" | mail -r root@moca.vn -s "restarting cms" monitor@moca.vn
fi

###MC
MC=$(ps aux | grep 'tomcat-[m]c/conf' | awk '{print $1,"\t",$2}' | wc -l)
RMC=`CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=7200 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false" CATALINA_BASE=/home/mc/tomcat-mc /opt/tomcat/bin/startup.sh`

if [ "$MC" -eq "1" ];
then
	echo "mc is running ..."
else
	echo "$RMC"
	echo -e "restarting mc at $(date)" | mail -r root@moca.vn -s "restarting mc" monitor@moca.vn
fi

###OPS
OPS=$(ps aux | grep 'tomcat-[o]ps/conf' | awk '{print $1,"\t",$2}' | wc -l)
ROPS=`CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=7199 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false" CATALINA_BASE=/home/ops/tomcat-ops /opt/tomcat/bin/startup.sh`

if [ "$OPS" -eq "1" ];
then
	echo "ops is running ..."
else
	echo "$ROPS"
	echo -e "restarting ops at $(date)" | mail -r root@moca.vn -s "restarting ops" monitor@moca.vn
fi

###MYMOCA
MYMOCA=$(ps aux | grep 'tomcat-[m]ymoca' | awk '{print $2}' | wc -l)
RMYMOCA=`CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=7203 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false" CATALINA_BASE=/home/mymoca/tomcat-mymoca /opt/tomcat/bin/startup.sh`

if [ "$MYMOCA" -eq "1" ];
then
	echo "mymoca is running ..."
else
	echo "$RMYMOCA"
	echo -e "restarting mymoca at $(date)" | mail -r root@moca.vn -s "restarting mymoca" monitor@moca.vn
fi

###CRM
CRM=$(ps aux | grep 'tomcat-[c]rm' | awk '{print $2}' | wc -l)
RCRM=`CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=7204 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false" CATALINA_BASE=/home/crm/tomcat-crm /opt/tomcat/bin/startup.sh`

if [ "$CRM" -eq "1" ];
then
	echo "crm is running ..."
else
	echo "$RCRM"
	echo -e "restarting crm at $(date)" | mail -r root@moca.vn -s "restarting crm" monitor@moca.vn
fi

###BPORTAL
BPORTAL=$(ps aux | grep 'tomcat-[b]portal' | awk '{print $2}' | wc -l)
RBPORTAL=`CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=7205 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false" CATALINA_BASE=/home/bportal/tomcat-bportal /opt/tomcat/bin/startup.sh`

if [ "$BPORTAL" -eq "1" ];
then
	echo "bportal is running ..."
else
	echo "$RBPORTAL"
	echo -e "restarting bportal at $(date)" | mail -r root@moca.vn -s "restarting bportal" monitor@moca.vn
fi
