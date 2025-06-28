#!/bin/bash

#Author:	  Tien
#Date:		  29/06/2016
#Location:	Moca HCMC office
#What:		  It runs automatically remote desktop to HCM-SRV-01 (local server at HCMC office)
	
rdesktop -g 1920x1080 -u 'hcm-srv-01' -p 'm0c@123' 10.10.10.251 >> /dev/null 2>&1
