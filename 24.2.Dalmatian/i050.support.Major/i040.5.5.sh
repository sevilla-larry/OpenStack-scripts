# i040.5.5.sh
#
# Build MemCached & python-MemCached
#
# https://docs.openstack.org/install-guide/environment-memcached.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i040.9.5.1.MemCacheD-1.6.32"
echo "i040.9.5.1.MemCacheD-1.6.32" >> $OSLOG_PROCESS

time { bash i040.9.5.1.MemCacheD-1.6.32.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.5.2.python-memcached-1.62"
echo "i040.9.5.2.python-memcached-1.62" >> $OSLOG_PROCESS

time { bash i040.9.5.2.python-memcached-1.62.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.5.4.MemCacheD.rc.d"
echo "i040.9.5.4.MemCacheD.rc.d" >> $OSLOG_PROCESS

time { bash i040.9.5.4.MemCacheD.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
