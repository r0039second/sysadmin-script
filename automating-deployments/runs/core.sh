#!/bin/bash

cd /home/tien/moca/codes/core/apps/moca-core
grails clean-all
grails compile
grails war
for f in `find ./target -type f -name "*.war"`; do scp $f d01:/home/pass; done
ssh -t d01 'sh /home/pass/dloy.sh'
echo "Welcome to paradise"
ssh -t d01 'tail -f /home/pass/tomcat-pass/logs/catalina.out'
