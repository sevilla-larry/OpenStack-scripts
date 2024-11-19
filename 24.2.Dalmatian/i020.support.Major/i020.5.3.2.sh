# i020.5.2.3.sh
#
# Build mod WSGI (Web Server Gateway Interface)
#
# https://docs.openstack.org/keystone/2024.2/install/keystone-install-ubuntu.html
#

export LFSLOG_PROCESS=$LFSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

#####

echo "i020.9.3.2.mod-wsgi-5.0.1"
echo "i020.9.3.2.mod-wsgi-5.0.1" >> $LFSLOG_PROCESS

time { bash i020.9.3.2.mod-wsgi-5.0.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $LFSLOG_PROCESS

echo "." >> $LFSLOG_PROCESS
echo "."
echo "."

#####

unset LFSLOG_PROCESS
