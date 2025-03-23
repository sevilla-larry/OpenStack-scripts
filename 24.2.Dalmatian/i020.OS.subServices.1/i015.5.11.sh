# i015.5.11.sh
#
# Python OpenStack Client support Apps
# Python OpenStack sub-Services Apps - 1
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i015.9.01.pbr-6.1.0"
echo "i015.9.01.pbr-6.1.0" >> $OSLOG_PROCESS

time { bash i015.9.01.pbr-6.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i015.9.02.stevedore-5.3.0"
echo "i015.9.02.stevedore-5.3.0" >> $OSLOG_PROCESS

time { bash i015.9.02.stevedore-5.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i015.9.03.os-service-types-1.7.0"
echo "i015.9.03.os-service-types-1.7.0" >> $OSLOG_PROCESS

time { bash i015.9.03.os-service-types-1.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i015.9.04.keystoneauth1-5.8.0"
echo "i015.9.04.keystoneauth1-5.8.0" >> $OSLOG_PROCESS

time { bash i015.9.04.keystoneauth1-5.8.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i015.9.05.requestsexceptions-1.4.0"
echo "i015.9.05.requestsexceptions-1.4.0" >> $OSLOG_PROCESS

time { bash i015.9.05.requestsexceptions-1.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i015.9.06.debtcollector-3.0.0"
echo "i015.9.06.debtcollector-3.0.0" >> $OSLOG_PROCESS

time { bash i015.9.06.debtcollector-3.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###


#####

unset OSLOG_PROCESS
