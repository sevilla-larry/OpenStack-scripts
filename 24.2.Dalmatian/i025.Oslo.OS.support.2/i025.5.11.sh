# i025.5.11.sh
#
# Python OpenStack Oslo support Apps - 2
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i025.9.01.dogpile.cache-1.3.3"
echo "i025.9.01.dogpile.cache-1.3.3" >> $OSLOG_PROCESS

time { bash i025.9.01.dogpile.cache-1.3.3.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###


#####

unset OSLOG_PROCESS
