# i1.0.11.3.1.sh
#
# Python OpenStack support minor
#
# for Controller Node
#
# Pass 3
#
# PyMySQL
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i1.3.1.PyMySQL-1.1.2"
echo "i1.3.1.PyMySQL-1.1.2" >> $OSLOG_PROCESS

time { bash i1.3.1.PyMySQL-1.1.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###


#####

unset OSLOG_PROCESS
