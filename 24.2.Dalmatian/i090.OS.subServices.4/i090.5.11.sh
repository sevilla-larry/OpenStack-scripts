# i090.5.11.sh
#
# Python OpenStack sub-Services Apps - 4
#
# for Controller Node
#

export OSLOG_PROCESS=$OSLOG/process.log

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

#####

echo "i090.9.01.pycadf-3.1.1"
echo "i090.9.01.pycadf-3.1.1" >> $OSLOG_PROCESS

time { bash i090.9.01.pycadf-3.1.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.02.keystonemiddleware-10.7.1"
echo "i090.9.02.keystonemiddleware-10.7.1" >> $OSLOG_PROCESS

time { bash i090.9.02.keystonemiddleware-10.7.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.03.osprofiler-4.2.0"
echo "i090.9.03.osprofiler-4.2.0" >> $OSLOG_PROCESS

time { bash i090.9.03.osprofiler-4.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.04.automaton-3.2.0"
echo "i090.9.04.automaton-3.2.0" >> $OSLOG_PROCESS

time { bash i090.9.04.automaton-3.2.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.05.taskflow-5.9.1"
echo "i090.9.05.taskflow-5.9.1" >> $OSLOG_PROCESS

time { bash i090.9.05.taskflow-5.9.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.06.glance_store-4.8.1"
echo "i090.9.06.glance_store-4.8.1" >> $OSLOG_PROCESS

time { bash i090.9.06.glance_store-4.8.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.07.os-win-5.9.0"
echo "i090.9.07.os-win-5.9.0" >> $OSLOG_PROCESS

time { bash i090.9.07.os-win-5.9.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.08.os-resource-classes-1.1.0"
echo "i090.9.08.os-resource-classes-1.1.0" >> $OSLOG_PROCESS

time { bash i090.9.08.os-resource-classes-1.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.09.os-traits-3.1.0"
echo "i090.9.09.os-traits-3.1.0" >> $OSLOG_PROCESS

time { bash i090.9.09.os-traits-3.1.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.10.microversion-parse-2.0.0"
echo "i090.9.10.microversion-parse-2.0.0" >> $OSLOG_PROCESS

time { bash i090.9.10.microversion-parse-2.0.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.11.os_brick-6.9.1"
echo "i090.9.11.os_brick-6.9.1" >> $OSLOG_PROCESS

time { bash i090.9.11.os_brick-6.9.1.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.12.ovsdbapp-2.8.0"
echo "i090.9.12.ovsdbapp-2.8.0" >> $OSLOG_PROCESS

time { bash i090.9.12.ovsdbapp-2.8.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.13.os_vif-3.7.0"
echo "i090.9.13.os_vif-3.7.0" >> $OSLOG_PROCESS

time { bash i090.9.13.os_vif-3.7.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

###

echo "i090.9.14.tooz-6.3.0"
echo "i090.9.14.tooz-6.3.0" >> $OSLOG_PROCESS

time { bash i090.9.14.tooz-6.3.0.sh ; }

date +"%Y/%b/%d %H:%M"
date +"%Y/%b/%d %H:%M" >> $OSLOG_PROCESS

echo "." >> $OSLOG_PROCESS
echo "."
echo "."

#####

unset OSLOG_PROCESS
