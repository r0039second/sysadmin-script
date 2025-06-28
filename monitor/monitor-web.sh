#!/bin/bash

# author:	Tien
# date:		07-07-2017
# purpose:	ensure website company is up.

response=`curl -sL -w "%{http_code}\\n" "https://company.vn" -o /dev/null`

if [ "$response" != 200 ]
then
	echo -e "website company is down" | mail -s "website company is down" monitor@company.vn
fi

