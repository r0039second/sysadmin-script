#!/bin/bash

user="monitor"
pass="monitor"
db="monitor"

echo "select l.date_created, l.mux, l.response_code from failed_iso_message_log l order by l.id desc limit 5;" | mysql -u "$user" -p "$pass" "$db" >> /home/tphanix/script/log.txt
