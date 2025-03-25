# i070.5.11.sh
#
# Python OpenStack sub-Services Apps - 2
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####
 
echo "i070.9.01.futurist-3.0.0"
echo "i070.9.01.futurist-3.0.0" >> $OSLOG_PROCESS

time { bash i070.9.01.futurist-3.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i070.9.02.castellan-5.1.1"
echo "i070.9.02.castellan-5.1.1" >> $OSLOG_PROCESS

time { bash i070.9.02.castellan-5.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
