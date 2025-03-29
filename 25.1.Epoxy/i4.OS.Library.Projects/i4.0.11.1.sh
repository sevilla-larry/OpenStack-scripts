# i4.00.11.1.sh
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


echo "i4.20.stevedore-5.4.1"
echo "i4.20.stevedore-5.4.1" >> $OSLOG_PROCESS

time { bash i4.20.stevedore-5.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.03 cliff-4.9.1 depends on i4.20 stevedore-5.4.1

echo "i4.03.cliff-4.9.1"
echo "i4.03.cliff-4.9.1" >> $OSLOG_PROCESS

time { bash i4.03.cliff-4.9.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i4.06.keystoneauth1-5.10.0"
echo "i4.06.keystoneauth1-5.10.0" >> $OSLOG_PROCESS

time { bash i4.06.keystoneauth1-5.10.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

# echo "i020.9.06.debtcollector-3.0.0"
# echo "i020.9.06.debtcollector-3.0.0" >> $OSLOG_PROCESS

# time { bash i020.9.06.debtcollector-3.0.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

#####

echo "i4.36.oslo.i18n-6.5.1"
echo "i4.36.oslo.i18n-6.5.1" >> $OSLOG_PROCESS

time { bash i4.36.oslo.i18n-6.5.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i4.49.oslo.utils-8.2.0"
echo "i4.49.oslo.utils-8.2.0" >> $OSLOG_PROCESS

time { bash i4.49.oslo.utils-8.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

# ###

# echo "i030.9.03.oslo.config-9.6.0"
# echo "i030.9.03.oslo.config-9.6.0" >> $OSLOG_PROCESS

# time { bash i030.9.03.oslo.config-9.6.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# echo "i030.9.04.oslo.serialization-5.5.0"
# echo "i030.9.04.oslo.serialization-5.5.0" >> $OSLOG_PROCESS

# time { bash i030.9.04.oslo.serialization-5.5.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# echo "i030.9.05.oslo.context-5.6.0"
# echo "i030.9.05.oslo.context-5.6.0" >> $OSLOG_PROCESS

# time { bash i030.9.05.oslo.context-5.6.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# echo "i030.9.06.oslo.log-6.1.2"
# echo "i030.9.06.oslo.log-6.1.2" >> $OSLOG_PROCESS

# time { bash i030.9.06.oslo.log-6.1.2.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

#####

unset OSLOG_PROCESS
