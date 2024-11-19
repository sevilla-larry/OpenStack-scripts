# i020.5.4.sh
#
# Install RabbitMQ
#
# https://docs.openstack.org/install-guide/environment-messaging.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i020.9.4.1.RabbitMQ-4.0.3"
echo "i020.9.4.1.RabbitMQ-4.0.3" >> $LFSLOG_PROCESS

time { bash i020.9.4.1.RabbitMQ-4.0.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

#
# Note:
#
# FAILED using init.d/rc.d to start-up
#
#echo "i020.9.4.4.RabbitMQ.rc.d"
#echo "i020.9.4.4.RabbitMQ.rc.d" >> $LFSLOG_PROCESS

#time { bash i020.9.4.4.RabbitMQ.rc.d.sh ; }

#date +"%Y/%b/%d %H:%M"
#date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#echo "." >> $LFSLOG_PROCESS
#echo "."
#echo "."

#####

unset LFSLOG_PROCESS
