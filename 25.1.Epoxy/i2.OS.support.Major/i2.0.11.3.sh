# i2.0.11.3.sh
#
# Build OpenStack support Major
#
# libwebsockets
#
# https://libwebsockets.org/lws-api-doc-master/html/md_README_8build.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i2.3.libwebsockets-4.4.1"
echo "i2.3.libwebsockets-4.4.1" >> $OSLOG_PROCESS

time { bash i2.3.libwebsockets-4.4.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
