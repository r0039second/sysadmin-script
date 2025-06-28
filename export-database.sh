#!/bin/bash

#author: tien phan
#date created: Fri Dec 11 11:57 AM
#version 0.1: it greps the value [-eq null | -ne "00\|null], after that it will send email to me.
#WHAT IS IT RUNNING?
#1. firstly it runs mysql command to get the data
#2. export to csv file (why csv? because I want to clean the result (column, row)
#3. send mail if any
#4. remove file csv above. (why? because I still do now how to overwrite in mysql command)

user=monitor
pass=monitor
db=monitor
host=localhost
sql='select NULLIF(l.response_code,'null') as response_code ,l.dedup_id, l.date_created, l.mux from failed_iso_message_log l WHERE l.date_created >= DATE_SUB(now(), INTERVAL 5 MINUTE) order by l.date_created desc;'
SUB_NULL="Cybersource connection is returing null"
SUB_OTHER="Cybersource connection is returing other codes"
log="/opt/log/cyber.csv"

#Run mysql command to get data
#run=`mysql --user="$user" --password="$pass" --database="$db" --execute=$sql`
#echo $run

mysql -u monitor -pmonitor -h localhost -D monitor -e "$sql" > "/opt/log/cyber.csv"

#mysql -u monitor -pmonitor -h localhost <<EOF
#use monitor;
#$sql;
#EOF

#Grep and sendmail
#grep -r "null" /opt/log/cyber.cvs | mail -r tien.phan@company.vn -s "$SUB_NULL" monitor@company.vn
#grep -v "00\|null" /opt/log/cyber.csv | mail -r tien.phan@company.vn -s "$SUB_OTHER" monitor@company.vn

#Remove file csv
#sleep 60
#rm -f /opt/log/cyber.log










#Get data within 5 minutes by group
#sql="select GROUP_CONCAT(NULLIF(l.response_code,'null') SEPARATOR '-'),l.dedup_id, max(l.date_created), l.mux from failed_iso_message_log l WHERE l.date_created > DATE_SUB(now(), INTERVAL 5 MINUTE)  group by l.mux  order by l.date_created desc INTO OUTFILE '/opt/log/cyber.log';"
#sql="select l.response_code, l.date_created, l.mux from failed_iso_message_log l order by l.id desc limit 5 INTO OUTFILE '/opt/log/cyber.log';"
#select * from failed_iso_message_log l order by l.date_created desc limit 5
