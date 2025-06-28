#!/bin/bash
# Filename:     Alert-Disk-Space
# Author:       Tien
# Date:         12/01/2017

# Environment Variable
mail="tien.phan@compny.vn"
partition="/dev/md126p7"
threshold="50"

percent=$(df -h | grep "$partition" | awk '{ print $5 }' | sed 's/%//g')
if ((percent > threshold))
then
        echo "$partition at $(hostname -f) is nearly full" | mail -s "Disk Space Alert" monitor@company.vn
fi

