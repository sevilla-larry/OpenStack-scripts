# i5.0.11.sh
#
# Python OpenStack Service Client Projects
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i5.07.python-cinderclient-9.7.0"
echo "i5.07.python-cinderclient-9.7.0" >> $OSLOG_PROCESS

time { bash i5.07.python-cinderclient-9.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i5.16.python-keystoneclient-5.6.0"
echo "i5.16.python-keystoneclient-5.6.0" >> $OSLOG_PROCESS

time { bash i5.16.python-keystoneclient-5.6.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

# echo "i040.9.13.python-glanceclient-4.7.0"
# echo "i040.9.13.python-glanceclient-4.7.0" >> $OSLOG_PROCESS

# time { bash i040.9.13.python-glanceclient-4.7.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# echo "i040.9.14.python-barbicanclient-7.0.0"
# echo "i040.9.14.python-barbicanclient-7.0.0" >> $OSLOG_PROCESS

# time { bash i040.9.14.python-barbicanclient-7.0.0.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

# ###

# echo "i040.9.15.python-neutronclient-11.3.1"
# echo "i040.9.15.python-neutronclient-11.3.1" >> $OSLOG_PROCESS

# time { bash i040.9.15.python-neutronclient-11.3.1.sh ; }

# date +"%Y/%b/%d %H:%M"
# date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

# echo "." >> $OSLOG_PROCESS
# echo "."
# echo "."

#####

unset OSLOG_PROCESS
