# i6.12.0.sh
#
# Build Glance
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i6.12.1.Glance-30.0.0"
echo "i6.12.1.Glance-30.0.0" >> $LFSLOG_PROCESS

time { bash i6.12.1.Glance-30.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i6.12.2.Glance.conf"
echo "i6.12.2.Glance.conf" >> $LFSLOG_PROCESS

time { bash i6.12.2.Glance.conf.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i6.12.3.Glance-api.rc.d"
echo "i6.12.3.Glance-api.rc.d" >> $LFSLOG_PROCESS

time { bash i6.12.3.Glance-api.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
