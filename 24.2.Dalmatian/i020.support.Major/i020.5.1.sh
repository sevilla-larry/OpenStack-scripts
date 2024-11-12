# i020.5.1.sh
#
# Build python_openstackclient
#
# https://docs.openstack.org/install-guide/environment-packages-ubuntu.html#client-installation
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i020.9.1.python_openstackclient-7.1.3"
echo "i020.9.1.python_openstackclient-7.1.3" >> $LFSLOG_PROCESS

time { bash i020.9.1.python_openstackclient-7.1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
