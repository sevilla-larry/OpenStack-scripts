# i6.21.0.sh
#
# Build Neutron
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i6.21.1.Neutron-26.0.1"
echo "i6.21.1.Neutron-26.0.1" >> $LFSLOG_PROCESS

time { bash i6.21.1.Neutron-26.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i6.21.2.Neutron.rc.d.sh"
echo "i6.21.2.Neutron.rc.d.sh" >> $LFSLOG_PROCESS

time { bash i6.21.2.Neutron.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
