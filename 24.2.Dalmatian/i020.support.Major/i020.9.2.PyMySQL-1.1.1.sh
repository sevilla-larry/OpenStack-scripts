# i020.9.2.PyMySQL-1.1.1.sh
#
# https://docs.openstack.org/install-guide/environment-sql-database.html
#

export PKG="PyMySQL"
export PKGLOG_DIR=$LFSLOG/020.2
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

echo "Python pip Install ..."
echo "Python pip Install ..." >> $LFSLOG_PROCESS
echo "Python pip Install ..." >> $PKGLOG_ERROR

python3 -m pip install $PKG > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
