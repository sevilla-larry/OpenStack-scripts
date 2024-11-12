# i020.5.2.2.sh
#
# Build PyMySQL
#
# https://docs.openstack.org/install-guide/environment-sql-database.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i020.9.2.PyMySQL-1.1.1"
echo "i020.9.2.PyMySQL-1.1.1" >> $LFSLOG_PROCESS

time { bash i020.9.2.PyMySQL-1.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
