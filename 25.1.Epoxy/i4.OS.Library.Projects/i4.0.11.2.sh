# i4.00.11.2.sh
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

# echo "i4.20.stevedore-5.4.1"
# echo "i4.20.stevedore-5.4.1" >> $OSLOG_PROCESS

# time { bash i4.20.stevedore-5.4.1.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# ##    i4.03 cliff-4.9.1 depends on i4.20 stevedore-5.4.1 pass 1

# echo "i4.03.cliff-4.9.1"
# echo "i4.03.cliff-4.9.1" >> $OSLOG_PROCESS

# time { bash i4.03.cliff-4.9.1.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

###

##    i4.14 openstacksdk-4.4.0 depends on i1.2.01 dogpile.cache-1.3.4

echo "i4.14.openstacksdk-4.4.0"
echo "i4.14.openstacksdk-4.4.0" >> $OSLOG_PROCESS

time { bash i4.14.openstacksdk-4.4.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

##    i4.18.osc-lib-3.2.0 depends on some i4.xx oslo.xxxxx-x.x.x

echo "i4.18.osc-lib-3.2.0"
echo "i4.18.osc-lib-3.2.0" >> $OSLOG_PROCESS

time { bash i4.18.osc-lib-3.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

# ###

# echo "i020.9.03.os-service-types-1.7.0"
# echo "i020.9.03.os-service-types-1.7.0" >> $OSLOG_PROCESS

# time { bash i020.9.03.os-service-types-1.7.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# echo "i020.9.04.keystoneauth1-5.8.0"
# echo "i020.9.04.keystoneauth1-5.8.0" >> $OSLOG_PROCESS

# time { bash i020.9.04.keystoneauth1-5.8.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# echo "i020.9.05.requestsexceptions-1.4.0"
# echo "i020.9.05.requestsexceptions-1.4.0" >> $OSLOG_PROCESS

# time { bash i020.9.05.requestsexceptions-1.4.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# echo "i020.9.06.debtcollector-3.0.0"
# echo "i020.9.06.debtcollector-3.0.0" >> $OSLOG_PROCESS

# time { bash i020.9.06.debtcollector-3.0.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

###


#####

unset OSLOG_PROCESS
