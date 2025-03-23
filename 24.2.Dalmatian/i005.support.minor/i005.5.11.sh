# i005.5.11.2.sh
#
# Build all Apps in i005
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####
 
#
# RabbitMQ is Binary Installed, simplejson is for Source building

# echo "i010.9.1.simplejson-3.19.3"
# echo "i010.9.1.simplejson-3.19.3" >> $OSLOG_PROCESS

# time { bash i010.9.1.simplejson-3.19.3.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

###

echo "i010.9.92.Erlang-26.2.5.5"
echo "i010.9.92.Erlang-26.2.5.5" >> $OSLOG_PROCESS

time { bash i010.9.92.Erlang-26.2.5.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

### 
#
# RabbitMQ is Binary Installed, Exlixir is for Source building

# echo "i010.9.3.Elixir-1.16.3"
# echo "i010.9.3.Elixir-1.16.3" >> $OSLOG_PROCESS

# time { bash i010.9.3.Elixir-1.16.3.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

###

# echo "i010.9.94.build-1.2.1"
# echo "i010.9.94.build-1.2.1" >> $OSLOG_PROCESS

# time { bash i010.9.94.build-1.2.1.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###
#       Note: Already included in LfS 12.2
# ###

# echo "i010.9.5.sshpass-1.10"
# echo "i010.9.5.sshpass-1.10" >> $OSLOG_PROCESS

# time { bash i010.9.5.sshpass-1.10.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

#####

unset OSLOG_PROCESS
