# i4.0.11.2.sh
#
# Python OpenStack Library Projects
#
# for Controller Node
#
# Pass 2
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

##    i4.2.14.openstacksdk-4.4.0
##      depends on some
##    i1.2.01 dogpile.cache-1.3.4

echo "i4.2.14.openstacksdk-4.4.0"
echo "i4.2.14.openstacksdk-4.4.0" >> $OSLOG_PROCESS

time { bash i4.2.14.openstacksdk-4.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.2.18.osc-lib-3.2.0
##      depends on some
##    i4.1.xx oslo.xxxxx-x.x.x

echo "i4.2.18.osc-lib-3.2.0"
echo "i4.2.18.osc-lib-3.2.0" >> $OSLOG_PROCESS

time { bash i4.2.18.osc-lib-3.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.2.31.oslo.cache-3.10.2
##      depends on
##    i1.2.01 dogpile.cache-1.3.4

echo "i4.2.31.oslo.cache-3.10.2"
echo "i4.2.31.oslo.cache-3.10.2" >> $OSLOG_PROCESS

time { bash i4.2.31.oslo.cache-3.10.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.2.35.oslo.db-17.2.1
##      depends on
##    i1.2.02 testresources-2.0.2
##    i1.2.05 testsceanarios-0.5.0

echo "i4.2.35.oslo.db-17.2.1"
echo "i4.2.35.oslo.db-17.2.1" >> $OSLOG_PROCESS

time { bash i4.2.35.oslo.db-17.2.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.2.07.keystonemiddleware-10.9.0
##      depends on
##    i4.2.31.oslo.cache-3.10.2

echo "i4.2.07.keystonemiddleware-10.9.0"
echo "i4.2.07.keystonemiddleware-10.9.0" >> $OSLOG_PROCESS

time { bash i4.2.07.keystonemiddleware-10.9.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
