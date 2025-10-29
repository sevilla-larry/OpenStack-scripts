# i6.24.2.Placement.conf.sh
#
# Notes: https://docs.openstack.org/placement/2025.1/configuration/index.html
#

#
# Required by:
#
#               i6.24.1 Openstack-Placement-13.0.0
#

export PKGLOG_DIR=$OSLOG/6.24.2
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

ETCDIR=/etc
PLACEMENTETCDIR=${ETCDIR}/placement
PLACEMENTETCDIRSAMPLE=${PLACEMENTETCDIR}/sample
CURRDIR=`pwd`
CNFMODE=644
CNFFILESRC1=${CURRDIR}/i6.24.3.placement.conf.txt
CNFFILEDST1=${PLACEMENTETCDIR}/placement.conf

echo "1. Install Placement Configuration ..."
echo "1. Install Placement Configuration ..." >> $OSLOG_PROCESS
echo "1. Install Placement Configuration ..." >> $PKGLOG_ERROR

cp -v   placement.conf.sample                   \
        placement.policy.yaml.sample            \
        ${PLACEMENTETCDIRSAMPLE}                \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cp -v   ${CNFFILESRC1} ${CNFFILEDST1}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -v ${CNFMODE} ${CNFFILEDST1}                 \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR placement:placement ${PLACEMENTETCDIR}        \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

APACHEETCDIR=${ETCDIR}/httpd
APACHECNFFILE=${APACHEETCDIR}/httpd.conf
APACHEETCEXTRADIR=${APACHEETCDIR}/extra
CNFFILESRC2=${CURRDIR}/i6.24.4.Placement.conf.for.Apache.txt
CNFFILEDST2=${APACHEETCEXTRADIR}/placement.conf

echo "2. Install Placement's Apache Configuration ..."
echo "2. Install Placement's Apache Configuration ..." >> $OSLOG_PROCESS
echo "2. Install Placement's Apache Configuration ..." >> $PKGLOG_ERROR

cp -v   ${CNFFILESRC2} ${CNFFILEDST2}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -v ${CNFMODE} ${CNFFILEDST2}                 \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -v apache:apache ${CNFFILEDST2}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat >> ${APACHECNFFILE} << "EOF"  2>> $PKGLOG_ERROR

# add wsgi Placement configuration file
Include /etc/httpd/extra/placement.conf
EOF


unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_ERROR
unset PKGLOG_DIR
