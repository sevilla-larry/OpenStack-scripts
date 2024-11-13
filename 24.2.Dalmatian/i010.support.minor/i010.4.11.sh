# i020.4.all.support.apps.sh
#
# Build all Apps in i010
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i010.9.1.simplejson-3.19.3"
echo "i010.9.1.simplejson-3.19.3" >> $LFSLOG_PROCESS

time { bash i010.9.1.simplejson-3.19.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i010.9.2.Erlang-26.2.5.5"
echo "i010.9.2.Erlang-26.2.5.5" >> $LFSLOG_PROCESS

time { bash i010.9.2.Erlang-26.2.5.5.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

###

echo "i010.9.3.Elixir-1.16.3"
echo "i010.9.3.Elixir-1.16.3" >> $LFSLOG_PROCESS

time { bash i010.9.3.Elixir-1.16.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
