# i2.0.11.1.sh
#
# Build OpenStack support Major
#
# Support Packages
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####
 
#
# RabbitMQ is Binary Installed, simplejson is for Source building

# echo "i045.9.1.simplejson-3.19.3"
# echo "i045.9.1.simplejson-3.19.3" >> $OSLOG_PROCESS

# time { bash i045.9.1.simplejson-3.19.3.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

###

echo "i2.1.2.Erlang-27.3.4.3"
echo "i2.1.2.Erlang-27.3.4.3" >> $OSLOG_PROCESS

time { bash i2.1.2.Erlang-27.3.4.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

### 
#
# RabbitMQ is Binary Installed, Exlixir is for Source building

# echo "i045.9.3.Elixir-1.16.3"
# echo "i045.9.3.Elixir-1.16.3" >> $OSLOG_PROCESS

# time { bash i045.9.3.Elixir-1.16.3.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

###

echo "i2.1.3.libwebsockets-4.4.1"
echo "i2.1.3.libwebsockets-4.4.1" >> $OSLOG_PROCESS

time { bash i2.1.3.libwebsockets-4.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i2.1.4.libcap-ng-0.8.5"
echo "i2.1.4.libcap-ng-0.8.5" >> $OSLOG_PROCESS

time { bash i2.1.4.libcap-ng-0.8.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
