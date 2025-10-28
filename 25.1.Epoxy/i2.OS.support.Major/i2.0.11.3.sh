# i2.0.11.2.sh
#
# Build OpenStack support Major
#
# MemCached
#
# https://docs.openstack.org/install-guide/environment-memcached.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i2.3.1.MemCacheD-1.6.39"
echo "i2.3.1.MemCacheD-1.6.39" >> $OSLOG_PROCESS

time { bash i2.3.1.MemCacheD-1.6.39.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i2.3.2.MemCacheD.rc.d"
echo "i2.3.2.MemCacheD.rc.d" >> $OSLOG_PROCESS

time { bash i2.3.2.MemCacheD.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
