#!/bin/bash
#chkconfig: 2345 20 80
#description: auto start x11vnc server
#source function library.
. /etc/init.d/functions

start() 
	{
	# code to start app comes here
	# example: daemon program_name &
	/bin/sh /home/tien/Script/start_vnc.sh &
	}
stop()
	{
	# code to stop app comes here
	# example: killproc program name
        /bin/sh /home/tien/Script/start_vnc.sh &
	}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		start
		;;
	status)
		#code to check status pf app comes here
		#example: status program_name
		;;
	*)
		echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0
