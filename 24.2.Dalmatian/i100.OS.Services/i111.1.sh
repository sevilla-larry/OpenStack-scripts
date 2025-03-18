# i111.1.sh
#
# Build Nova
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i111.3.Nova-30.0.0"
echo "i111.3.Nova-30.0.0" >> $LFSLOG_PROCESS

time { bash i111.3.Nova-30.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i111.5.Nova.rc.d"
echo "i111.5.Nova.rc.d" >> $LFSLOG_PROCESS

time { bash i111.5.Nova.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i111.6.noVNC"
echo "i111.6.noVNC" >> $LFSLOG_PROCESS

time { bash i111.6.noVNC.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
