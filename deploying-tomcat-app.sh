#! /bin/bash

##SCRIPT FOR DEPLOYING THE NEW WAR VERSION
#CHANGE LOG
#version 0.1 (--/ --/ --) unknown author
#version 0.2 (July 14 2015) by tienphan: this is a separate for each instance
#version 0.3 (July 27 2015) by tienphan: update kill port jvmx & remove war file in /home

#step 1: backup war before deploying the new version
cd /home/pass
today=$(date '+%d.%m.%Y-%H.%M');
cp tomcat-pass/webapps/*.war "/home/pass/history/moca-$today.war"

#step 2: shutdown the tomcat
CATALINA_BASE=/home/pass/tomcat-pass /opt/tomcat/bin/shutdown.sh
sleep 15

#step 3: verify to ensure the tomcat was shutdown
kill $(ps aux | grep 'tomcat-[p]ass' | awk '{print $2}')

#step 4: kill jvm port
fuser -k [port]/tcp  #[port] port is using by jvmx. You can see in port in /tomcat/bin/setenv.sh

#step 5: delete war file in webapps tomcat
rm -rf tomcat-pass/webapps/*

#step 6: copy the new war file to webapps for deploying
cp *.war tomcat-pass/webapps/moca.war

#step 7: start  the tomcat
CATALINA_BASE=/home/pass/tomcat-pass /opt/tomcat/bin/start.sh
sleep 15

#step 8: verify to ensure the tomcat was started
echo `ps aux | grep 'tomcat-[p]ass' | awk '{print $2}'`

#echo 9: remove the war file in /home
rm -f *.war
