# i020.9.2.3.MariaDB.OpenStack.cnf.sh
#
# https://docs.openstack.org/install-guide/environment-sql-database-ubuntu.html
#

export PKGLOG_DIR=$LFSLOG/020.2
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export LFSLOG_PROCESS=$LFSLOG/process.log

export CONFFILE1=i020.9.2.4.MariaDB.OpenStack.cnf
export CONFDIR=/etc/mysql/mariadb.conf.d/
export CONFFILE2=99-openstack.cnf

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Install Configuration ..."
echo "Install Configuration ..." >> $LFSLOG_PROCESS
echo "Install Configuration ..." >> $PKGLOG_ERROR

install -v -d -m755 $CONFDIR                    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cp -v $CONFFILE1 $CONFDIR/$CONFFILE2            \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


unset CONFDIR CONFFILE1 CONFFILE2
unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
