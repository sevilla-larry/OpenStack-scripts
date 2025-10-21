# i1.4.1.2.mariadb.my.cnf.sh
#
# Notes: https://docs.openstack.org/install-guide/environment-sql-database-ubuntu.html
#

#
# Required by:
#
#                               OpenStack
#

export PKGLOG_DIR=$OSLOG/1.4.1.2
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

ETCDIR=/etc
CURRDIR=`pwd`
CONFMODE=644
CNFFILESRC=${CURRDIR}/i1.4.1.3.mariadb.99-openstack.cnf.txt
CNFFILEDST=${ETCDIR}/mariadb/mariadb.conf.d/99-openstack.cnf

echo "1. Install OpenStack's MariaDB Configuration ..."
echo "1. Install OpenStack's MariaDB Configuration ..." >> $OSLOG_PROCESS
echo "1. Install OpenStack's MariaDB Configuration ..." >> $PKGLOG_ERROR

cp -v ${CNFFILESRC} ${CNFFILEDST}       \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -v ${CONFMODE} ${CNFFILEDST}      \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -v mariadb:mariadb ${CNFFILEDST}  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_ERROR
unset PKGLOG_DIR
