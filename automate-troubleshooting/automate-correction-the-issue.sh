#!/bin/bash

#VARIABLE
PASS=$(ps aux | grep 'tomcat-[p]ass' | awk '{print $1,"\t",$2}' | wc -l)
GOOD="Application Server startup"
BAD="Application Server has been broken down"
RE_PASS='CATALINA_OPTS="-Dcom.sun.management.jmxremote=true -Dcom.sun.management.jmxremote.port=9202 -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false" CATALINA_BASE=/home/pass/tomcat-pass /opt/tomcat/bin/startup.sh'
RE_DEPLOYED="Application Server has been re-deployed"

if [ "$PASS" -eq "1" ];
then
	echo "Server is running ..."
else
	echo -e $(mail -r root@moca.vn -s "$BAD" monitor@moca.vn)
	echo -e "$RE_PASS"

fi
