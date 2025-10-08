# i2.0.11.3.sh
#
# Build OpenStack support Major
#
# Etcd
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i2.21.etcd-3.6.5"
echo "i2.21.etcd-3.6.5" >> $OSLOG_PROCESS

time { bash i2.21.etcd-3.6.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i2.23.etcd.rc.d"
echo "i2.23.etcd.rc.d" >> $OSLOG_PROCESS

time { bash i2.23.etcd.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
