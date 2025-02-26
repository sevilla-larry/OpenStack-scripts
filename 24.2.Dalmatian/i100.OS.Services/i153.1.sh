# i153.1.sh
#
# Build Glance
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i153.8.Glance-29.0.0"
echo "i153.8.Glance-29.0.0" >> $LFSLOG_PROCESS

time { bash i153.8.Glance-29.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i153.8.Glance-api.rc.d"
echo "i153.8.Glance-api.rc.d" >> $LFSLOG_PROCESS

time { bash i153.8.Glance-api.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
