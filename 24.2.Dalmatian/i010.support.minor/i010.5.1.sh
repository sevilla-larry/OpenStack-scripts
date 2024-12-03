# i010.5.1.sh
#
# Python OpenStack Client support Apps
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####
 
echo "i010.9.1.pbr-6.1.0"
echo "i010.9.1.pbr-6.1.0" >> $OSLOG_PROCESS

time { bash i010.9.1.pbr-6.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
