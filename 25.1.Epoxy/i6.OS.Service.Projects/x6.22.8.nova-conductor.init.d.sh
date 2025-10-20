#!/bin/sh

# by Grok Expeort 2025/Oct/20

. /lib/lsb/init-functions

program="/usr/bin/nova-conductor"
pidfile="/run/nova-conductor.pid"
args="--config-file /etc/nova/nova.conf --log-file /var/log/nova/nova-conductor.log"

case "$1" in
  start)
    log_info_msg "Starting Nova Conductor..."
    start_daemon -p "$pidfile" "$program" $args
    evaluate_retval
    ;;
  stop)
    log_info_msg "Stopping Nova Conductor..."
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
