# i3.0.11.4.sh
#
# Build OpenStack support Major
# OpenStack Hosted apps
#
# Etcd
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#
# Pass 4
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i3.4.1.etcd-3.1.10 bin"
echo "i3.4.1.etcd-3.1.10 bin" >> $OSLOG_PROCESS

time { bash i3.4.1.etcd-3.1.10.bin.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i3.4.3.etcd.rc.d"
echo "i3.4.3.etcd.rc.d" >> $OSLOG_PROCESS

time { bash i3.4.3.etcd.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
