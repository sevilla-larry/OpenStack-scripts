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

##    i5.2.01.osc-placement-4.6.0
##      depends on
##    i4.2.18 osc-lib-3.2.0

echo "i5.2.01.osc-placement-4.6.0"
echo "i5.2.01.osc-placement-4.6.0" >> $OSLOG_PROCESS

time { bash i5.2.01.osc-placement-4.6.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i5.2.10.python-designateclient-6.2.0
##      depends on
##    i4.2.18 osc-lib-3.2.0

echo "i5.2.10.python-designateclient-6.2.0"
echo "i5.2.10.python-designateclient-6.2.0" >> $OSLOG_PROCESS

time { bash i5.2.10.python-designateclient-6.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
