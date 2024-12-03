# i020.9.2.PyMySQL-1.1.1.sh
#
# https://docs.openstack.org/install-guide/environment-sql-database.html
#

export PKG="PyMySQL-1.1.1-py3-none-any.whl"
export PKGLOG_DIR=$LFSLOG/020.2
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Pip3 Install ..."
echo "Pip3 Install ..." >> $LFSLOG_PROCESS
echo "Pip3 Install ..." >> $PKGLOG_ERROR

pip3 install $PKG > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR


unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
