# i030.5.1.sh
#
# Python Openstack Oslo Apps - Part 1
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i030.9.01.oslo.i18n-6.4.0"
echo "i030.9.01.oslo.i18n-6.4.0" >> $OSLOG_PROCESS

time { bash i030.9.01.oslo.i18n-6.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i030.9.02.oslo.utils-7.3.0"
echo "i030.9.02.oslo.utils-7.3.0" >> $OSLOG_PROCESS

time { bash i030.9.02.oslo.utils-7.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i030.9.03.oslo.config-9.6.0"
echo "i030.9.03.oslo.config-9.6.0" >> $OSLOG_PROCESS

time { bash i030.9.03.oslo.config-9.6.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i030.9.04.oslo.serialization-5.5.0"
echo "i030.9.04.oslo.serialization-5.5.0" >> $OSLOG_PROCESS

time { bash i030.9.04.oslo.serialization-5.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i030.9.05.oslo.context-5.6.0"
echo "i030.9.05.oslo.context-5.6.0" >> $OSLOG_PROCESS

time { bash i030.9.05.oslo.context-5.6.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i030.9.06.oslo.log-6.1.2"
echo "i030.9.06.oslo.log-6.1.2" >> $OSLOG_PROCESS

time { bash i030.9.06.oslo.log-6.1.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."


#####

unset OSLOG_PROCESS
