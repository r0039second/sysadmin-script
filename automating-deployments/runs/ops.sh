#!/bin/bash

cd /home/tien/moca/codes/core/apps/ops-portal
grails clean-all
grails compile
grails war
for f in `find ./target -type f -name "*.war"`; do scp $f d01:/home/ops; done
ssh -t d01 'sh /home/ops/dloy.sh'
echo "Welcome to paradise"
ssh -t d01 'tail -f /home/ops/tomcat-ops/logs/catalina.out'
