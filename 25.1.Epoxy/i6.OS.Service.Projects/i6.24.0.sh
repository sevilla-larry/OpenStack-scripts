# i152.1.sh
#
# Build Placement
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i6.24.1.Openstack-Placement-13.0.0"
echo "i6.24.1.Openstack-Placement-13.0.0" >> $LFSLOG_PROCESS

time { bash i6.24.1.Openstack-Placement-13.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i6.24.2.Placement.conf"
echo "i6.24.2.Placement.conf" >> $LFSLOG_PROCESS

time { bash i6.24.2.Placement.conf.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
