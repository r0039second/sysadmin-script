#!/bin/sh

#Author:	Tien Phan
#Purpose:	send mail when the applications is down
#Version:	0.1

MC=$(ps aux | grep 'tomcat-[m]c' | awk '{print $1."\t",$2}' | wc -l)
CMS=$(ps aux | grep 'tomcat-[c]ms' | awk '{print $1,"\t",$2}' | wc -l)
OPS=$(ps aux | grep 'tomcat-[o]ps' | awk '{print $1,"\t",$2}' | wc -l)
CRM=$(ps aux | grep 'tomcat-[c]rm' | awk '{print $1,"\t",$2}' | wc -l)
PASS=$(ps aux | grep 'tomcat-[p]ass' | awk '{print $1,"\t",$2}' | wc -l)
MYMOCA=$(ps aux | grep 'tomcat-[m]ymoca' | awk '{print $1,"\t",$2}' | wc -l)
BPORTAL=$(ps aux | grep 'tomcat-[b]portal' | awk '{print $1,"\t",$2}' | wc -l)
SUB_MC="MC is down"
SUB_CMS="CMS is down"
SUB_OPS="OPS is down"
SUB_CRM="CRM is down"
SUB_PASS="PASS is down"
SUB_MYMOCA="MYMOCA is down"
SUB_BPORTAL="BPORTAL is down"

#MC application
if [ "$MC" -eq "1" ];
then
	echo -e "MC is up"
else
	echo -e "MC is down" | mail -r root@moca.vn -s "$SUB_MC" monitor@moca.vn #send email
fi

#CMS application
if [ "$CMS" -eq "1" ];
then
	echo -e "CMS is up"
else
	echo -e "CMS is down" | mail -r root@moca.vn -s "$SUB_CMS" monitor@moca.vn #send email
fi

#OPS application
if [ "$OPS" -eq "1" ];
then
	echo -e "OPS is up"
else
	echo -e "OPS is down" | mail -r root@moca.vn -s "$SUB_OPS" monitor@moca.vn #send mail
fi

#CRM application
if [ "$CRM" -eq "1" ];
then
	echo -e "CRM is up"
else
	echo -e "CRM is down" | mail -r root@moca.vn -s "$SUB_CRM" monitor@moca.vn #send mail
fi

#PASS application
if [ "$PASS" -eq "1" ];
then
	echo -e "PASS is up"
else
	echo -e "PASS is down" | mail -r root@moca.vn -s "$SUB_CRM" monitor@moca.vn #send mail
fi

#MYMOCA application
if [ "$MYMOCA" -eq "1" ];
then
	echo -e "MYMOCA is up"
else
	echo -e "MYMOCA is down" | mail -r root@moca.vn -s "$SUB_MYMOCA" monitor@moca.vn #send mail
fi

#BPORTAL application
if [ "BPORTAL" -eq "1" ];
then
	echo -e "BPORTAL is up"
else
	echo -e "BPORTAL is down" | mail -r root@moca.vn -s "$SUB_BPORTAL" monitor@moca.vn #send mail
fi
