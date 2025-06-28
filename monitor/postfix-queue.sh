#!/bin/bash

for q in maildrop incoming active defer deferred

    do
        count=$(find /var/spool/postfix/$q ! -type d -print | wc -l)
        echo $q $count
    done
