# i2.0.11.4.sh
#
# Build OpenStack support Major
#
# OpenVSwitch
#
# https://docs.openvswitch.org/en/latest/intro/install/general/
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i2.4.1.openvswitch-3.3.6"
echo "i2.4.1.openvswitch-3.3.6" >> $OSLOG_PROCESS

time { bash i2.4.1.openvswitch-3.3.6.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i2.4.2.openvswitch.rc.d"
echo "i2.4.2.openvswitch.rc.d" >> $OSLOG_PROCESS

time { bash i2.4.2.openvswitch.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
