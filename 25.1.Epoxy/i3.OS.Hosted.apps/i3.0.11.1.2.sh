# i3.0.11.1.2.sh
#
# Build OpenStack support Major
# OpenStack Hosted apps
#
# Etcd
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i3.1.11.etcd-3.1.10"
echo "i3.1.11.etcd-3.1.10" >> $OSLOG_PROCESS

time { bash i3.1.11.etcd-3.1.10.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i3.1.13.etcd.rc.d"
echo "i3.1.13.etcd.rc.d" >> $OSLOG_PROCESS

time { bash i3.1.13.etcd.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
