#!/bin/sh
########################################################################
# Begin rabbitmq
#
# Description : RabbitMQ Server Control Script
#
#
# Author      : Grok 2025/Oct/28
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

# Set UTF-8 locale to avoid Elixir encoding warning (applies to ctl commands run as root)
export LANG=C.UTF-8

RABBITMQ_SBIN=/usr/sbin
PIDFILE=/var/run/rabbitmq/rabbitmq-server.pid
USER=rabbitmq
SYMLINK_PID=/var/run/rabbitmq-server.pid

prepare_dirs() {
      install -v -d -m 2755 -o rabbitmq -g rabbitmq /var/run/rabbitmq
}

case "$1" in
   start)
      log_info_msg "Starting RabbitMQ server..."
      prepare_dirs
      
      su -s /bin/sh $USER -c "$RABBITMQ_SBIN/rabbitmq-server -detached"
      su -s /bin/sh $USER -c "$RABBITMQ_SBIN/rabbitmqctl wait $PIDFILE"
      # Create symlink for statusproc compatibility
      ln -sf $PIDFILE $SYMLINK_PID
      evaluate_retval
      ;;

   stop)
      log_info_msg "Stopping RabbitMQ server..."
      $RABBITMQ_SBIN/rabbitmqctl shutdown
      evaluate_retval
      [ -f "$PIDFILE" ] && rm -f "$PIDFILE"
      [ -f "$SYMLINK_PID" ] && rm -f "$SYMLINK_PID"
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