# i1.0.11.2.sh
#
# Python OpenStack support minor
#
# for Controller Node
#
# Pass 2
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i1.2.01.dogpile.cache-1.3.4"
echo "i1.2.01.dogpile.cache-1.3.4" >> $OSLOG_PROCESS

time { bash i1.2.01.dogpile.cache-1.3.4.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###


#####

unset OSLOG_PROCESS
