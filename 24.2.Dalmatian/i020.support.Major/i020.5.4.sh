# i020.5.4.sh
#
# Build MemCached & python-MemCached
#
# https://docs.openstack.org/install-guide/environment-memcached.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i020.9.4.1.MemCacheD-1.6.32"
echo "i020.9.4.1.MemCacheD-1.6.32" >> $LFSLOG_PROCESS

time { bash i020.9.4.1.MemCacheD-1.6.32.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i020.9.4.2.python_memcached-1.62"
echo "i020.9.4.2.python_memcached-1.62" >> $LFSLOG_PROCESS

time { bash i020.9.4.2.python_memcached-1.62.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i020.9.4.4.MemCacheD.rc.d"
echo "i020.9.4.4.MemCacheD.rc.d" >> $LFSLOG_PROCESS

time { bash i020.9.4.4.MemCacheD.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
