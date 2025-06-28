#!/bin/bash

#Author: tienphan
#Change Logs:
#Version 0.1 17092015 My purpose is that every morning, I will receive the report of the production server to monitor@company.vn. 

TIME=$(date +%Y%m%d_%H%M%S)
#SUBJECT="$TIME_S01 SYSTEM REPORT"
SUBJECT="S01 MORNING SYSTEM REPORT"

/bin/sh /opt/script/motd.sh | mail -r root@company.vn -s "$SUBJECT" monitor@company.vn
