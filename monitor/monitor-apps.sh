#!/bin/bash

# Author:	Tien
# Date:		07-06-2017

# monitor nginx master process
ps auxw | grep "nginx: master process" | grep -v grep > /dev/null

if [ $? != 0 ]
then
	echo -e "nginx production is down" | mail -s "nginx production is down" monitor@company.vn
fi

# monitor haproxy process
ps auxw | grep haproxy | grep -v grep > /dev/null

if [ $? != 0 ]
then
	echo -e "haproxy production is down" | mail -s "hapoxy production is down" monitor@company.vn
fi

# monitor company-core process
ps auxw | grep tomcat-pass | grep -v grep > /dev/null

if [ $? != 0 ]
then
	echo -e "company-core production is down" | mail -s "company-core production is down" monitor@company.vn
fi

# monitor company-cms process
ps auxw | grep tomcat-cms | grep -v grep > /dev/null

if [ $? != 0 ]
then
        echo -e "company-cms production is down" | mail -s "company-cms production is down" monitor@company.vn
fi

# monitor company-mc process
ps auxw | grep tomcat-mc | grep -v grep > /dev/null

if [ $? != 0 ]
then
        echo -e "company-mc production is down" | mail -s "company-mc production is down" monitor@company.vn
fi

# monitor company-ops
ps auxw | grep tomcat-ops | grep -v grep > /dev/null

if [ $? != 0 ]
then
        echo -e "company-ops production is down" | mail -s "company-ops production is down" monitor@company.vn
fi

# monitor company-bankportal
ps auxw | grep tomcat-bportal | grep -v grep > /dev/null

if [ $? != 0 ]
then
        echo -e "company-bank-portal production is down" | mail -s "company-bank-portal production is down" monitor@company.vn
fi

# monitor company-crm
ps auxw | grep tomcat-crm | grep -v grep > /dev/null

if [ $? != 0 ]
then
        echo -e "company-crm production is down" | mail -s "company-crm production is down" monitor@company.vn
fi

# monitor company-mycompany
ps auxw | grep tomcat-mycompany | grep -v grep > /dev/null

if [ $? != 0 ]
then
        echo -e "company-mycompany production is down" | mail -s "company-mycompany production is down" monitor@company.vn
fi

# monitor mysql process
/etc/init.d/mysql status | grep running | grep -v grep > /dev/null

if [ $? != 0 ]
then
        echo "mysql production is down" | mail -s "mysql production is down" monitor@company.vn
fi

# monitor postfix process
/etc/init.d/postfix status | grep running | grep -v grep > /dev/null

if [ $? != 0 ]
then
	echo "postfix production is down" | mail -s "postfix production is down" monitor@company.vn
fi

# monitor rabbitmq process
/etc/init.d/rabbitmq-server status | grep "Status of node rabbit@s01" > /dev/null

if [ $? != 0 ]
then
	echo "rabbitmq production is down" | mail -s "rabbiitmq production is down" monitor@company.vn
fi

# monitor redis server
/etc/init.d/redis status | grep running > /dev/null

if [ $? != 0 ]
then
	echo "redis production is down" | mail -s "redis production is down" monitor@company.vn
fi

