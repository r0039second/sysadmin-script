#!/bin/bash

cd /home/tien/moca/codes/core/apps/merchant-portal 
grails clean-all
grails compile
grails war
for f in `find ./target -type f -name "*.war"`; do scp $f d01:/home/mc; done
ssh -t d01 'sh /home/mc/dloy.sh'
echo "Welcome to paradise"
ssh -t d01 'tail -f /home/mc/tomcat-mc/logs/catalina.out'
