#!/bin/sh
########################################################################
# Begin rabbitmq
#
# Description : RabbitMQ Server Control Script
#
#
# Author      : Grok 2025/Oct/26
# Version     : RabbitMQ 4.1.4 (was based on RabbitMQ 4.0.3)
#
########################################################################

### BEGIN INIT INFO
# Provides:            rabbitmq
# Required-Start:      $network
# Should-Start:        $syslog
# Required-Stop:       $network
# Should-Stop:         $syslog
# Default-Start:       2 3 4 5
# Default-Stop:        0 1 6
# Short-Description:   Starts RabbitMQ server.
# Description:         Controls the RabbitMQ messaging server.
# X-LFS-Provided-By:   Custom
### END INIT INFO

. /lib/lsb/init-functions

# Set UTF-8 locale to avoid Elixir encoding warning
export LANG=C.UTF-8

RABBITMQ_SBIN=/usr/sbin
PIDFILE=/var/run/rabbitmq/rabbitmq-server.pid
export HOME=/var/lib/rabbitmq  # Enforce cookie location
export RABBITMQ_ERLANG_COOKIE="OPENSTACK"  # Optional: enforce specific cookie

case "$1" in
   start)
      log_info_msg "Starting RabbitMQ server..."
      start_daemon $RABBITMQ_SBIN/rabbitmq-server -detached
      $RABBITMQ_SBIN/rabbitmqctl wait $PIDFILE
    #   sleep 5
    #   $RABBITMQ_SBIN/rabbitmqctl start_app
    #   sleep 5
      evaluate_retval
      ;;

   stop)
      log_info_msg "Stopping RabbitMQ server..."
    #   $RABBITMQ_SBIN/rabbitmqctl shutdown
      $RABBITMQ_SBIN/rabbitmqctl stop $PIDFILE
      evaluate_retval
      [ -f "$PIDFILE" ] && rm -f "$PIDFILE"
      ;;

   restart)
      $0 stop
      sleep 1
      $0 start
      ;;

   status)
      statusproc $RABBITMQ_SBIN/rabbitmq-server
      ;;

   *)
      echo "Usage: $0 {start|stop|restart|status}"
      exit 1
      ;;
esac

exit 0

# End rabbitmq
