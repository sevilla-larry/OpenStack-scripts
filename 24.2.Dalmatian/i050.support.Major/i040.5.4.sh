# i040.5.4.sh
#
# Install RabbitMQ
#
# https://docs.openstack.org/install-guide/environment-messaging.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i040.9.4.1.RabbitMQ-4.0.3"
echo "i040.9.4.1.RabbitMQ-4.0.3" >> $OSLOG_PROCESS

time { bash i040.9.4.1.RabbitMQ-4.0.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i040.9.4.4.RabbitMQ.rc.d"
echo "i040.9.4.4.RabbitMQ.rc.d" >> $OSLOG_PROCESS

time { bash i040.9.4.4.RabbitMQ.rc.d.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
