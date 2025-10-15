# i4.0.11.2.sh
#
# Python OpenStack Library Projects
#
# for Controller Node
#
# Pass 3
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

##    i4.3.07.keystonemiddleware-10.9.0
##      depends on
##    i4.2.31.oslo.cache-3.10.2

echo "i4.3.07.keystonemiddleware-10.9.0"
echo "i4.3.07.keystonemiddleware-10.9.0" >> $OSLOG_PROCESS

time { bash i4.3.07.keystonemiddleware-10.9.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
