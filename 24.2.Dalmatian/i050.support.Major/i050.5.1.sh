# i050.5.1.sh
#
# Build python_openstackclient
#
# https://docs.openstack.org/install-guide/environment-packages-ubuntu.html#client-installation
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i050.9.1.python-openstackclient-7.1.3"
echo "i050.9.1.python-openstackclient-7.1.3" >> $OSLOG_PROCESS

time { bash i050.9.1.python-openstackclient-7.1.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
