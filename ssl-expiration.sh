#!/bin/bash

#Author: Tien Phan
#Change Logs:
#Version 0.1 07122015 What time is SSL Certificate expriration? I write a script to do it. It will be alerted to me within the next 15 days.
#I'm trying to think differently to improve "brain". Hope it better.

SUBJECT="company SSL Certificate has EXPIRED within 15 DAYS. Please RENEW ASAP!"

if openssl x509 -checkend 1296000 -noout -in /etc/ssl/company/company5.pem
then
  echo -e "Certificate is good for another day!"
else
  echo -e "Certificate has expired or will do so within 15 days!"
  echo -e "SSL Certificate has EXPIRED within 15 days, please inform: \n\n \t\tmr. long tran 0934343422 & renew asap" | mail -r tien.phan@company.vn -s "$SUBJECT" monitor@company.vn
fi
