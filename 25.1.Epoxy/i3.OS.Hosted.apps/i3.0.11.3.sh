# i3.0.11.3.sh
#
# Python OpenStack Hosted apps
#
# for Controller Node
#
# Pass 3
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

##    i3.3.01.os-client-config-2.1.0
##      depends on
##    i4.2.14.openstacksdk-4.4.0

echo "i3.3.01.os-client-config-2.1.0"
echo "i3.3.01.os-client-config-2.1.0" >> $OSLOG_PROCESS

time { bash i3.3.01.os-client-config-2.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
