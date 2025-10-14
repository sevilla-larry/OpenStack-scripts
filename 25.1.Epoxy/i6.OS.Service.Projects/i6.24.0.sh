# i152.1.sh
#
# Build Placement
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i152.3.Openstack-Placement-12.0.0"
echo "i152.3.Openstack-Placement-12.0.0" >> $LFSLOG_PROCESS

time { bash i152.3.Openstack-Placement-12.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i152.5.Placement-api.rc.d"
echo "i152.5.Placement-api.rc.d" >> $LFSLOG_PROCESS

time { bash i152.5.Placement-api.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
