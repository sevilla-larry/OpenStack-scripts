# i6.22.2.Nova.conf.sh
#
# Notes: https://docs.openstack.org/nova/2025.1/configuration/index.html

#
# Required by:
#
#               i6.22.1 Nova-31.1.0
#

export PKGLOG_DIR=$OSLOG/6.22.2
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

ETCDIR=/etc
NOVAETCDIR=${ETCDIR}/nova
NOVAETCDIRSAMPLE=${NOVAETCDIR}/sample
CURRDIR=`pwd`
MODE=755
CNFFILESRC=${CURRDIR}/i6.22.4.nova.conf.txt
CNFFILEDST=${NOVAETCDIR}/nova.conf

echo "1. Install Nova Configuration ..."
echo "1. Install Nova Configuration ..." >> $OSLOG_PROCESS
echo "1. Install Nova Configuration ..." >> $PKGLOG_ERROR

cp -v   nova.conf.sample                        \
        nova.policy.yaml.sample                 \
        ${NOVAETCDIRSAMPLE}                     \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cp -v   ${CNFFILESRC} ${CNFFILEDST}             \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -v ${MODE} ${CNFFILEDST}                  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR nova:nova ${NOVAETCDIR}               \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_ERROR
unset PKGLOG_DIR
