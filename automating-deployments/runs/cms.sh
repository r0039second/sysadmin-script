#!/bin/bash

cd /home/tien/moca/codes/core/apps/cms
grails clean-all
grails compile
grails war
for f in `find ./target -type f -name "*.war"`; do scp $f d01:/home/cms; done
ssh -t d01 'sh /home/cms/dloy.sh'
echo "Welcome to paradise"
ssh -t d01 'tail -f /home/pass/tomcat-cms/logs/catalina.out'
