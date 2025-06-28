#!/bin/bash

#AUTHOR:	 Tien Phan
#DATE CREATEDd:	 Fri Dec 11 11:57 AM
#VERSION 0.1:	 it greps the value [-eq null | -ne "00\|null], after that it will send email to me.
#        0.1.1:  great! finally it have done. I'm stupid :D (Mon Dec 14 6:39 PM)
#	 0.1.2:  in the last version, I use "-eq" = "1". And my logic is ugly. It could not cover all cases. Today I have just changed "-eq" to "-ge" = "1". It means that is greater than or equal to. Hope it helps.

##############################################################################################################
#   WHAT IS IT RUNNING?                                                                                      #
#   1. firstly it runs mysql command to get the data                                                         # 
#   2. export to csv file (why csv? because I want to clean the result (column, row)                         #
#   3. send mail if any                                                                                      #
#   4. remove file csv above. (why? because I still do not how to overwrite in mysql command)                #
##############################################################################################################

#I. VARIABLES
user=monitor
pass=monitor
db=monitor
host=localhost
sql='select IFNULL(l.response_code,'999') as response_code ,l.dedup_id, l.date_created, l.mux from failed_iso_message_log l WHERE l.date_created >= DATE_SUB(now(), INTERVAL 5 MINUTE) order by l.date_created desc;'
SUB_NULL="Cybersource connection is returing null"
SUB_OTHER="Cybersource connection is returing other codes"
log="/opt/log/cyber.csv"
NULL=`grep -r "999" /opt/log/cyber.csv | wc -l`
NULL_CT=`grep -r "999" /opt/log/cyber.csv`
OTHER=`grep -v "00\|999" /opt/log/cyber.csv | wc -l`
OTHER_CT=`grep -v "00\|999" /opt/log/cyber.csv`


#II. RUN MYSQL COMMAND TO GET DATA
mysql -u monitor -pmonitor -h localhost -D monitor -e "$sql" >> "/opt/log/cyber.csv"


#III. GREP AND SEND MAIL
#1. null
if [ "$NULL" -ge "1" ];
then
	echo "$NULL_CT" | mail -r root@company.vn -s "$SUB_NULL" monitor@company.vn
#	echo "OK"
else
	echo -e "Nothing for null"
fi

#2. other
if [ "$OTHER" -ge "1" ];
then
	echo "$OTHER_CT" | mail -r root@company.vn -s "$SUB_OTHER" monitor@company.vn
#	echo "OK"
else
	echo -e "Nothing for other codes"
fi
	
#IV. REMOVE CSV FILE
sleep 60
rm -f /opt/log/cyber.csv
