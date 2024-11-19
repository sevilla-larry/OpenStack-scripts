# i020.5.6.sh
#
# Install Etcd
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i020.9.6.1.etcd-3.5.17"
echo "i020.9.6.1.etcd-3.5.17" >> $LFSLOG_PROCESS

time { bash i020.9.6.1.etcd-3.5.17.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i020.9.6.4.etcd.rc.d"
echo "i020.9.6.4.etcd.rc.d" >> $LFSLOG_PROCESS

time { bash i020.9.6.4.etcd.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
