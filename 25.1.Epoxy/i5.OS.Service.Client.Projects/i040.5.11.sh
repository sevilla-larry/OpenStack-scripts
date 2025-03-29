# i040.5.11.sh
#
# Python OpenStack Client support Apps
# Python OpenStack sub-Services Apps - 2
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i040.9.01.cliff-4.7.0"
echo "i040.9.01.cliff-4.7.0" >> $OSLOG_PROCESS

time { bash i040.9.01.cliff-4.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.02.openstacksdk-4.0.1"
echo "i040.9.02.openstacksdk-4.0.1" >> $OSLOG_PROCESS

time { bash i040.9.02.openstacksdk-4.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.03.osc-lib-3.1.0"
echo "i040.9.03.osc-lib-3.1.0" >> $OSLOG_PROCESS

time { bash i040.9.03.osc-lib-3.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.04.os-client-config-2.1.0"
echo "i040.9.04.os-client-config-2.1.0" >> $OSLOG_PROCESS

time { bash i040.9.04.os-client-config-2.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.11.python-keystoneclient-5.5.0"
echo "i040.9.11.python-keystoneclient-5.5.0" >> $OSLOG_PROCESS

time { bash i040.9.11.python-keystoneclient-5.5.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.12.python-cinderclient-9.6.0"
echo "i040.9.12.python-cinderclient-9.6.0" >> $OSLOG_PROCESS

time { bash i040.9.12.python-cinderclient-9.6.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.13.python-glanceclient-4.7.0"
echo "i040.9.13.python-glanceclient-4.7.0" >> $OSLOG_PROCESS

time { bash i040.9.13.python-glanceclient-4.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.14.python-barbicanclient-7.0.0"
echo "i040.9.14.python-barbicanclient-7.0.0" >> $OSLOG_PROCESS

time { bash i040.9.14.python-barbicanclient-7.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.15.python-neutronclient-11.3.1"
echo "i040.9.15.python-neutronclient-11.3.1" >> $OSLOG_PROCESS

time { bash i040.9.15.python-neutronclient-11.3.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."


#####

unset OSLOG_PROCESS
