# i080.5.11.sh
#
# Python Openstack Oslo Apps - Part 2
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i080.9.01.oslo.cache-3.8.0"
echo "i080.9.01.oslo.cache-3.8.0" >> $OSLOG_PROCESS

time { bash i080.9.01.oslo.cache-3.8.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.02.oslo.concurrency-6.1.0"
echo "i080.9.02.oslo.concurrency-6.1.0" >> $OSLOG_PROCESS

time { bash i080.9.02.oslo.concurrency-6.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.03.oslo.service-3.5.0"
echo "i080.9.03.oslo.service-3.5.0" >> $OSLOG_PROCESS

time { bash i080.9.03.oslo.service-3.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.04.oslo.middleware-6.2.0"
echo "i080.9.04.oslo.middleware-6.2.0" >> $OSLOG_PROCESS

time { bash i080.9.04.oslo.middleware-6.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.05.oslo.metrics-0.9.0"
echo "i080.9.05.oslo.metrics-0.9.0" >> $OSLOG_PROCESS

time { bash i080.9.05.oslo.metrics-0.9.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.06.oslo.messaging-14.9.1"
echo "i080.9.06.oslo.messaging-14.9.1" >> $OSLOG_PROCESS

time { bash i080.9.06.oslo.messaging-14.9.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.07.oslo.db-16.0.0"
echo "i080.9.07.oslo.db-16.0.0" >> $OSLOG_PROCESS

time { bash i080.9.07.oslo.db-16.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.08.oslo.policy-4.4.0"
echo "i080.9.08.oslo.policy-4.4.0" >> $OSLOG_PROCESS

time { bash i080.9.08.oslo.policy-4.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.09.oslo.upgradecheck-2.4.0"
echo "i080.9.09.oslo.upgradecheck-2.4.0" >> $OSLOG_PROCESS

time { bash i080.9.09.oslo.upgradecheck-2.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.10.oslo.limit-2.5.0"
echo "i080.9.10.oslo.limit-2.5.0" >> $OSLOG_PROCESS

time { bash i080.9.10.oslo.limit-2.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.11.oslo.reports-3.4.0"
echo "i080.9.11.oslo.reports-3.4.0" >> $OSLOG_PROCESS

time { bash i080.9.11.oslo.reports-3.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.12.oslo.rootwrap-7.3.0"
echo "i080.9.12.oslo.rootwrap-7.3.0" >> $OSLOG_PROCESS

time { bash i080.9.12.oslo.rootwrap-7.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.13.oslo.privsep-3.4.0"
echo "i080.9.13.oslo.privsep-3.4.0" >> $OSLOG_PROCESS

time { bash i080.9.13.oslo.privsep-3.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i080.9.14.oslo.versionedobjects-3.4.0"
echo "i080.9.14.oslo.versionedobjects-3.4.0" >> $OSLOG_PROCESS

time { bash i080.9.14.oslo.versionedobjects-3.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
