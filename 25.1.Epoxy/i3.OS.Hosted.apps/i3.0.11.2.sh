# i3.0.11.2.sh
#
# Python OpenStack Hosted apps
#
# for Controller Node
#
# Pass 2
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

## these apps
## depends on
## oslo.* apps

#####

echo "i3.2.01.pycadf-4.0.1"
echo "i3.2.01.pycadf-4.0.1" >> $OSLOG_PROCESS

time { bash i3.2.01.pycadf-4.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i3.2.02.osprofiler-4.2.0"
echo "i3.2.02.osprofiler-4.2.0" >> $OSLOG_PROCESS

time { bash i3.2.02.osprofiler-4.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i3.2.03.os-win-5.9.0"
echo "i3.2.03.os-win-5.9.0" >> $OSLOG_PROCESS

time { bash i3.2.03.os-win-5.9.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
