# i5.0.11.2.sh
#
# Python OpenStack Service Client Projects
#
# for Controller Node
#
# Pass 2
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

##    i5.3.21.python-neutronclient-11.4.0
##      depends on
##    i3.3.01.os-client-config-2.1.0

echo "i5.3.21.python-neutronclient-11.4.0"
echo "i5.3.21.python-neutronclient-11.4.0" >> $OSLOG_PROCESS

time { bash i5.3.21.python-neutronclient-11.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
