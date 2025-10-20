# i6.22.0.sh
#
# Build Nova
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i6.22.1.Nova-31.1.0"
echo "i6.22.1.Nova-31.1.0" >> $LFSLOG_PROCESS

time { bash i6.22.1.Nova-31.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i6.22.2.Nova.conf"
echo "i6.22.2.Nova.conf" >> $LFSLOG_PROCESS

time { bash i6.22.2.Nova.conf.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i6.22.3.Nova.rc.d"
echo "i6.22.3.Nova.rc.d" >> $LFSLOG_PROCESS

time { bash i6.22.3.Nova.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

# ###

# echo "i6.22.4.noVNC-1.6.0"
# echo "i6.22.4.noVNC-1.6.0" >> $LFSLOG_PROCESS

# time { bash i6.22.4.noVNC-1.6.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

# echo "." >> $LFSLOG_PROCESS
# echo "."
# echo "."

#####

unset LFSLOG_PROCESS
