# i6.16.2.KeyStone.conf.sh
#
# Notes: https://docs.openstack.org/keystone/2025.1/configuration/samples/index.html
#

#
# Required by:
#
#               i6.16.1 KeyStone-27.0.0
#

export PKGLOG_DIR=$OSLOG/6.16.2
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

ETCDIR=/etc
KEYSTONEETCDIR=${ETCDIR}/keystone
KEYSTONEETCDIRSAMPLE=${KEYSTONEETCDIR}/sample
CURRDIR=`pwd`
CNFMODE=644
CNFFILESRC1=${CURRDIR}/i6.16.3.keystone.conf.txt
CNFFILEDST1=${KEYSTONEETCDIR}/keystone.conf
CNFFILESRC2=${CURRDIR}/i6.16.5.policy.yaml.txt
CNFFILEDST2=${KEYSTONEETCDIR}/policy.yaml
CNFFILESRC3=${CURRDIR}/i6.16.6.policy.yaml.sample.txt
CNFFILEDST3=${KEYSTONEETCDIRSAMPLE}/policy.yaml.sample

echo "1. Install Keystone Configuration ..."
echo "1. Install Keystone Configuration ..." >> $OSLOG_PROCESS
echo "1. Install Keystone Configuration ..." >> $PKGLOG_ERROR

cp -v   keystone.conf.sample                    \
        ${KEYSTONEETCDIRSAMPLE}                 \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   ${CNFFILESRC1} ${CNFFILEDST1}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   ${CNFFILESRC2} ${CNFFILEDST2}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   ${CNFFILESRC3} ${CNFFILEDST3}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -v ${CNFMODE}     ${CNFFILEDST1}          \
         ${CNFFILEDST2} ${CNFFILEDST3}          \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR keystone:keystone ${KEYSTONEETCDIR}   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# chown -vR apache:apache ${KEYSTONEETCDIR}/policy.yaml   \
#         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

APACHEETCDIR=${ETCDIR}/httpd
APACHECNFFILE=${APACHEETCDIR}/httpd.conf
APACHEETCEXTRADIR=${APACHEETCDIR}/extra
CNFFILESRC4=${CURRDIR}/i6.16.4.KeyStone.conf.for.Apache.txt
CNFFILEDST4=${APACHEETCEXTRADIR}/keystone.conf

echo "2. Install Keystone's Apache Configuration ..."
echo "2. Install Keystone's Apache Configuration ..." >> $OSLOG_PROCESS
echo "2. Install Keystone's Apache Configuration ..." >> $PKGLOG_ERROR

cp -v   ${CNFFILESRC4} ${CNFFILEDST4}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -v ${CNFMODE} ${CNFFILEDST4}                 \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -v apache:apache ${CNFFILEDST4}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cat >> ${APACHECNFFILE} << "EOF"  2>> $PKGLOG_ERROR

# add wsgi KeyStone configuration file
Include /etc/httpd/extra/keystone.conf
EOF


unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_ERROR
unset PKGLOG_DIR
