#!/bin/sh

# https://gist.github.com/congleetea/584de6db5cd6678a42c48fdb13d2a050

########################################
## install/link etcd* in /usr/bin/ ####
## mv this file to /etc/init.d/etcd ####
## mv config file to /etc ####
########################################

. /lib/lsb/init-functions

#DAEMON=/usr/bin/etcd
CONF=/etc/etcd.conf.yml
LOGFILE=/var/log/etcd/etcd.log
DAEMON_OPTS="--config-file $CONF 2>> $LOGFILE"

case "$1" in

   start)
      log_info_msg "Starting etcd server..."

      start_daemon su - etcd -c '/usr/bin/etcd $DAEMON_OPTS'
      evaluate_retval
    ;;

    stop)
       log_info_msg "Stopping etcd server..."
       killproc /usr/bin/etcd
       evaluate_retval
     ;;

    *)
       echo "Usage: $0 {start | stop}"
       exit 1
     ;;

esac

# End /etc/init.d/etcd
