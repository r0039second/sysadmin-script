#!/bin/bash

#add to crontab to automatically check the status application

ps auxw | grep apache2 | grep -v grep > /dev/null

if [ $? != 0 ]
then
	/etc/init.d/apache2 start > /dev/null
fi
