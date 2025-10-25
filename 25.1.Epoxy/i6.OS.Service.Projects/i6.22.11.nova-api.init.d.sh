#!/bin/sh

# by Grok Expert 2025/Oct/20

. /lib/lsb/init-functions

program="/usr/bin/nova-api"
pidfile="/run/nova-api.pid"
args="--config-file /etc/nova/nova.conf --log-file /var/log/nova/nova-api.log"

case "$1" in
  start)
    log_info_msg "Starting Nova API..."
    start_daemon -p "$pidfile" "$program" $args
    evaluate_retval
    ;;
  stop)
    log_info_msg "Stopping Nova API..."
    killproc -p "$pidfile" "$program"
    evaluate_retval
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  status)
    statusproc -p "$pidfile" "$program"
    ;;
  *)
    echo "Usage: $0 {start|stop|restart|status}"
    exit 1
    ;;
esac
