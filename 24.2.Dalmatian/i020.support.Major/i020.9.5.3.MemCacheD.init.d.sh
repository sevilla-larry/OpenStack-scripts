#!/bin/sh
########################################################################
# Begin memcached
#
# Description : Start MemCacheD Daemon
#
# Author      : Sevilla, Larry - sevilla.larry.prg@gmail.com
#

# Version     : OS 24.2
#

########################################################################

### BEGIN INIT INFO
# Provides:             memcached
# ??? Required-Start:      $network
# ??? Should-Start:        networkmanager wicd
# ??? Required-Stop:       $network
# ??? Should-Stop:         networkmanager wicd
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description:    Starts MemCacheD server.
# Description:          Starts MemCacheD.
# Provided-By:          Sevilla, Larry
### END INIT INFO

. /lib/lsb/init-functions

case "$1" in
   start)
      log_info_msg "Starting MemCacheD Server..."

      start_daemon /usr/bin/memcached
      evaluate_retval
      ;;

   stop)
      log_info_msg "Stopping MemCacheD Server..."
      killproc /usr/bin/memcached
      evaluate_retval
      ;;

   restart)
      $0 stop
      sleep 1
      $0 start
      ;;

   status)
      statusproc /usr/bin/memcached
      ;;

   *)
      echo "Usage: $0 {start|stop|restart|status}"
      exit 1
      ;;
esac

# End /etc/init.d/memcached
