# i1.0.11.3.sh
#
# Python OpenStack support minor
#
# for Controller Node
#
# Pass 3
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

##    i1.3.01.cursive-0.2.3
##      depends on some
##    i4.1.xx oslo.xxxxx-x.x.x
##    i4.2.01 castellan

echo "i1.3.01.cursive-0.2.3"
echo "i1.3.01.cursive-0.2.3" >> $OSLOG_PROCESS

time { bash i1.3.01.cursive-0.2.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
