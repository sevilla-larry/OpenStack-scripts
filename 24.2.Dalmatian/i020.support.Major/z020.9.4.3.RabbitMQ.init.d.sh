#!/bin/sh
########################################################################
# Begin rabbitmq
#
# Description : Start RabbitMQ Daemon
#
# Author      : Sevilla, Larry - sevilla.larry.prg@gmail.com
#
#       Note  : NOT executed due to message below
#
# Version     : OS 24.2
#

########################################################################

### BEGIN INIT INFO
# Provides:             rabbitmq
# ??? Required-Start:      $network
# ??? Should-Start:        networkmanager wicd
# ??? Required-Stop:       $network
# ??? Should-Stop:         networkmanager wicd
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description:    Starts RabbitMQ server.
# Description:          Starts Rabbit Message Queue Daemon (rabbitmq_server).
# Provided-By:          Sevilla, Larry
### END INIT INFO

. /lib/lsb/init-functions

case "$1" in
   start)
      log_info_msg "Starting RabbitMQ Server..."

      #start_daemon /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmq-server -detached
      /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmq-server -detached
      sleep 1
      /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmqctl start_app
      evaluate_retval
      ;;
      #
      # Note giving msg:
      # warning: the VM is running with native name encoding of latin1
      #          which may cause Elixir to malfunction as it expects utf8.
      # Please ensure your locale is set to UTF-8
      #          (which can be verified by running "locale" in your shell)
      #     or set the ELIXIR_ERL_OPTIONS="+fnu" environment variable
      #

   stop)
      log_info_msg "Stopping RabbitMQ Server..."
#      killproc /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmq-server
      /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmqctl shutdown
      evaluate_retval
      ;;

   reload)
      log_info_msg "Reloading RabbitMQ Server..."
#      killproc /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmq-server -HUP
      /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmqctl stop_app
        sleep 1
      /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmqctl reset
      evaluate_retval
      ;;

   restart)
      $0 stop
      sleep 1
      $0 start
      ;;

   status)
      statusproc /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmq-server
      /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmqctl status
      /usr/local/rabbitmq_server-4.0.3/sbin/rabbitmqctl cluster_status
      ;;

   *)
      echo "Usage: $0 {start|stop|reload|restart|status}"
      exit 1
      ;;
esac

# End /etc/init.d/rabbitmq
