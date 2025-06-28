#!/bin/bash

#VARIABLES
PASS=$(ps aux | grep 'tomcat-[p]ass' | awk '{print $1,"\t",$2}' | wc -l)
GOOD="AppServer startup"
BADD="AppServer has been broken down"
DLOY="AppServer has been re-deployed"
KILL_PROCESS=`kill $(ps aux | grep 'tomcat-[p]ass' | awk '{print $2}'`
KILL_PORT=`fuser -k 7202/tcp`

if [ "$PASS" -eq "1" ];
then
	echo "Server is running ..."
else
	echo -e $(mail -r root@moca.vn -s "$BADD" monitor@moca.vn)
	echo -e "$KILL_PROCESS"
	echo -e "$KILL_PORT"
	echo -e "`/bin/sh pass.sh`" #exact path for the script file
fi

sleep 60

#VARIABLES
GREP=$(tail -n 50 /home/pass/tomcat-pass/logs/catalina.out | grep "Server startup in" | wc -l)
if [ "$GREP" -eq "1" ];
then
	echo "Deploy Ok"
else
	echo -e $(mail -r root@moca.vn -s "$BADD" monitor@moca.vn)
	echo -e "$KILL_PROCESS"
	echo -e "$KILL_PORT"
	echo -e "`/bin/sh pass.sh`" #exact path for the script file
fi
