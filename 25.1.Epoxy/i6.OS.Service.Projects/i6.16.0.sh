# i6.16.0.sh
#
# Build KeyStone
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i6.16.1.KeyStone-27.0.0"
echo "i6.16.1.KeyStone-27.0.0" >> $LFSLOG_PROCESS

time { bash i6.16.1.KeyStone-27.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i6.16.2.KeyStone.conf"
echo "i6.16.2.KeyStone.conf" >> $LFSLOG_PROCESS

time { bash i6.16.2.KeyStone.conf.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
