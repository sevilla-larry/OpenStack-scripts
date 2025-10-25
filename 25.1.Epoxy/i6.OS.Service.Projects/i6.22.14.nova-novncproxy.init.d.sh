#!/bin/sh

# by Grok Expeort 2025/Oct/20

. /lib/lsb/init-functions

program="/usr/bin/nova-novncproxy"
pidfile="/run/nova-novncproxy.pid"
args="--config-file /etc/nova/nova.conf --log-file /var/log/nova/nova-novncproxy.log"

case "$1" in
  start)
    log_info_msg "Starting Nova noVNC Proxy..."
    start_daemon -p "$pidfile" "$program" $args
    evaluate_retval
    ;;
  stop)
    log_info_msg "Stopping Nova noVNC Proxy..."
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
