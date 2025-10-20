#!/bin/sh

# by Grok Expert 2025/Oct/20

. /lib/lsb/init-functions

program="/usr/bin/nova-scheduler"
pidfile="/run/nova-scheduler.pid"
args="--config-file /etc/nova/nova.conf --log-file /var/log/nova/nova-scheduler.log"

case "$1" in
  start)
    log_info_msg "Starting Nova Scheduler..."
    start_daemon -p "$pidfile" "$program" $args
    evaluate_retval
    ;;
  stop)
    log_info_msg "Stopping Nova Scheduler..."
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
