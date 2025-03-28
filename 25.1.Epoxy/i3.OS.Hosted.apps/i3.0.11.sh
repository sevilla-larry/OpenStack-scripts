# i3.00.11.sh
#
# Python OpenStack Hosted apps
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i3.01.pbr-6.1.1"
echo "i3.01.pbr-6.1.1" >> $OSLOG_PROCESS

time { bash i3.01.pbr-6.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i3.02.os-service-types-1.7.0"
echo "i3.02.os-service-types-1.7.0" >> $OSLOG_PROCESS

time { bash i3.02.os-service-types-1.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i3.03.requestsexceptions-1.4.0"
echo "i3.03.requestsexceptions-1.4.0" >> $OSLOG_PROCESS

time { bash i3.03.requestsexceptions-1.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i3.04.debtcollector-3.0.0"
echo "i3.04.debtcollector-3.0.0" >> $OSLOG_PROCESS

time { bash i3.04.debtcollector-3.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###


#####

unset OSLOG_PROCESS
