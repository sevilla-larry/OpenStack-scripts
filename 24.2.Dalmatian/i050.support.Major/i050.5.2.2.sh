# i050.5.2.2.sh
#
# Build PyMySQL
#
# https://docs.openstack.org/install-guide/environment-sql-database.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i050.9.2.2.PyMySQL-1.1.1"
echo "i050.9.2.2.PyMySQL-1.1.1" >> $OSLOG_PROCESS

time { bash i050.9.2.2.PyMySQL-1.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
