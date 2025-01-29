# i020.5.2.3.sh
#
# Build mod WSGI (Web Server Gateway Interface)
#
# https://docs.openstack.org/keystone/2024.2/install/keystone-install-ubuntu.html
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i020.9.3.2.mod-wsgi-5.0.2"
echo "i020.9.3.2.mod-wsgi-5.0.2" >> $OSLOG_PROCESS

time { bash i020.9.3.2.mod-wsgi-5.0.2.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
