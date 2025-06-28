#!/bin/bash

#Author: tienphan
#Change Logs:
#Version 0.1 15092015 It monitors the company PROXY VPBank and sends mail when the connection is down.
#Version 0.2 -------- I will add the re-check feature. When VPBank Proxy is down, it will be re-checked to decide whether to send mail.
#Version 0.3 10112015 Add monitor for OCB connection
#Version 0.3.1 01032015 Add monitor for ACB connection
#Version 1.0 Long change VPB monitoring to look for the file /tmp/vpbank_proxy_is_down

#banks=( "vpbank" "acb" "company" "cybersource" "vib")
banks=( "vpbank" "acb" "company" "cybersource" "msb")
#banks=( "vpbank" "acb" "company" "cybersource")

declare -A contacts
contacts["vpbank"]="Please contact: Nam"
contacts["ocb"]="Please contact: Hoang"
contacts["acb"]="Please contact: Viet"
contacts["company"]="Please contact: Long"
SUBJECT="company Proxy at ${bank} is DOWN"

for bank in "${banks[@]}"
do
	if [ -f "/tmp/proxy_${bank}_is_up" ];
	then
	  echo -e "company Proxy at ${bank} is UP"
	else
	  echo -e "company Proxy at ${bank} is DOWN. ${contacts[${bank}]}"
	  echo -e "company Proxy at ${bank} is DOWN, ${contacts[${bank}]}" | mail -r root@company.vn -s "$SUBJECT" monitor@company.vn
	fi
	  
done
