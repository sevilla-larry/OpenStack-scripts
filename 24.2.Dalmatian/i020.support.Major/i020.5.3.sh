# i020.5.3.sh
#
# Build RabbitMQ
#
# https://docs.openstack.org/install-guide/environment-messaging.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i020.9.3.RabbitMQ-4.0.3"
echo "i020.9.3.RabbitMQ-4.0.3" >> $LFSLOG_PROCESS

time { bash i020.9.3.RabbitMQ-4.0.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
