# i8.00.11.sh
#
# Puthon Openstack Other Projects
#
# ( Build python_openstackclient )
#
# https://docs.openstack.org/install-guide/environment-packages-ubuntu.html#client-installation
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i8.23.python-openstackclient-7.5.0"
echo "i8.23.python-openstackclient-7.5.0" >> $OSLOG_PROCESS

time { bash i8.23.python-openstackclient-7.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
