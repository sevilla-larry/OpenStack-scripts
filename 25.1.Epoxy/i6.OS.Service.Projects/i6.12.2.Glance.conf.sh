# i6.12.2.Glance.conf.sh
#
# Notes: https://docs.openstack.org/glance/2025.1/configuration/index.html
#

#
# Required by:
#
#               i6.12.1 Glance-30.0.0
#

export PKGLOG_DIR=$OSLOG/6.12.2
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

ETCDIR=/etc
GLANCEETCDIR=${ETCDIR}/glance
CURRDIR=`pwd`
MODE=755
CNFFILESRC=${CURRDIR}/i6.12.4.glance-api.conf.txt
CNFFILEDST=${GLANCEETCDIR}/glance-api.conf

echo "1. Install Glance API Configuration ..."
echo "1. Install Glance API Configuration ..." >> $OSLOG_PROCESS
echo "1. Install Glance API Configuration ..." >> $PKGLOG_ERROR

cp -v   ${CNFFILESRC} ${CNFFILEDST}             \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -v ${MODE} ${CNFFILEDST}                  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR glance:glance /etc/glance             \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_ERROR
unset PKGLOG_DIR
