# i050.5.6.sh
#
# Install Etcd
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i050.9.6.1.etcd-3.5.17"
echo "i050.9.6.1.etcd-3.5.17" >> $OSLOG_PROCESS

time { bash i050.9.6.1.etcd-3.5.17.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i050.9.6.4.etcd.rc.d"
echo "i050.9.6.4.etcd.rc.d" >> $OSLOG_PROCESS

time { bash i050.9.6.4.etcd.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
