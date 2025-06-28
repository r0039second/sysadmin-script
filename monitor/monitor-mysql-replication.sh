#!/bin/bash

#Author: Tien
#Date Created: Thu Feb 25 11:24 AM

#VARIABLES
status=0
SLAVE="210.211.107.18"
EMAIL=monitor@company.vn
DOWN="Replication status - Down"
UP="Replication status - Up"
GOODMESG="MySQL Replication on $SLAVE is good."

#PROCESS
SQLResponse=`mysql -uroot -pMoc@579 -e "show slave status\G" | grep -i "Slave_SQL_Running" | gawk '{print $2}'`
IOResponse=`mysql -uroot -pMoc@579 -e "show slave status\G" | grep -i "Slave_IO_Running" | gawk '{print $2}'`

if [ "$SQLReponse" = "No" ]; then
	error="MySQL Slave $SLAVE has stopped. Slave_SQL_Running = No"
	status=1
fi

if [ "$IOResponse" = "No" ]; then
	error="MySQL Slave $SLAVE has stopped. Slave_IO_Running = No"
	status=1
fi

#ACTION
if [ $status = 1 ]; then
	for address in $EMAIL; do
	echo -e $error | mail -s "$DOWN" $address
	echo "Replication is down, sent email to $address"
done
fi

if [ $status = 0 ]; then
	for address in $EMAIL; do
#	echo -e $GOODMESG | mail -s "$GOODMESG" $address
	echo "Replication is up, still sent email to $address"
done
fi
