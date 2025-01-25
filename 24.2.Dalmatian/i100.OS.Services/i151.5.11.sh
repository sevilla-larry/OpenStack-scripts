# i151.5.11.sh
#
# Build KeyStone
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i151.9.1.bcrypt-4.0.1"
echo "i151.9.1.bcrypt-4.0.1" >> $LFSLOG_PROCESS

time { bash i151.9.1.bcrypt-4.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i151.9.8.KeyStone-26.0.0"
echo "i151.9.8.KeyStone-26.0.0" >> $LFSLOG_PROCESS

time { bash i151.9.8.KeyStone-26.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
