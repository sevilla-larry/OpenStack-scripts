# i4.0.11.1.sh
#
# Python OpenStack Library Projects
#
# for Controller Node
#
# Pass 1
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####


echo "i4.1.20.stevedore-5.4.1"
echo "i4.1.20.stevedore-5.4.1" >> $OSLOG_PROCESS

time { bash i4.1.20.stevedore-5.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.1.03 cliff-4.9.1
##      depends on
##    i4.1.20 stevedore-5.4.1

echo "i4.1.03.cliff-4.9.1"
echo "i4.1.03.cliff-4.9.1" >> $OSLOG_PROCESS

time { bash i4.1.03.cliff-4.9.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i4.1.06.keystoneauth1-5.10.0"
echo "i4.1.06.keystoneauth1-5.10.0" >> $OSLOG_PROCESS

time { bash i4.1.06.keystoneauth1-5.10.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i4.1.36.oslo.i18n-6.5.1"
echo "i4.1.36.oslo.i18n-6.5.1" >> $OSLOG_PROCESS

time { bash i4.1.36.oslo.i18n-6.5.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.1.33 oslo.config-9.7.1
##      depends on
##    i4.1.36 oslo.i18n-6.5.1

echo "i4.1.33.oslo.config-9.7.1"
echo "i4.1.33.oslo.config-9.7.1" >> $OSLOG_PROCESS

time { bash i4.1.33.oslo.config-9.7.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i4.1.34.oslo.context-5.7.1"
echo "i4.1.34.oslo.context-5.7.1" >> $OSLOG_PROCESS

time { bash i4.1.34.oslo.context-5.7.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i4.1.38.oslo.log-7.1.0"
echo "i4.1.38.oslo.log-7.1.0" >> $OSLOG_PROCESS

time { bash i4.1.38.oslo.log-7.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i4.1.49.oslo.utils-8.2.0"
echo "i4.1.49.oslo.utils-8.2.0" >> $OSLOG_PROCESS

time { bash i4.1.49.oslo.utils-8.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.1.32.oslo.concurrency-7.1.0
##      depends on
##    i4.1.49.oslo.utils-8.2.0

echo "i4.1.32.oslo.concurrency-7.1.0"
echo "i4.1.32.oslo.concurrency-7.1.0" >> $OSLOG_PROCESS

time { bash i4.1.32.oslo.concurrency-7.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.1.41.oslo.middleware-6.3.1
##      depends on
##    i4.1.49.oslo.utils-8.2.0

echo "i4.1.41.oslo.middleware-6.3.1"
echo "i4.1.41.oslo.middleware-6.3.1" >> $OSLOG_PROCESS

time { bash i4.1.41.oslo.middleware-6.3.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.1.46.oslo.serialization-5.7.0
##      depends on
##    i4.1.49.oslo.utils-8.2.0

echo "i4.1.46.oslo.serialization-5.7.0"
echo "i4.1.46.oslo.serialization-5.7.0" >> $OSLOG_PROCESS

time { bash i4.1.46.oslo.serialization-5.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i4.1.47.oslo.service-4.1.1"
echo "i4.1.47.oslo.service-4.1.1" >> $OSLOG_PROCESS

time { bash i4.1.47.oslo.service-4.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.1.39.oslo.messaging-16.1.0
##      depends on
##    i4.1.49.oslo.utils-8.2.0
##    i4.1.46.oslo.serialization-5.7.0

echo "i4.1.39.oslo.messaging-16.1.0"
echo "i4.1.39.oslo.messaging-16.1.0" >> $OSLOG_PROCESS

time { bash i4.1.39.oslo.messaging-16.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
