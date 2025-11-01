# i2.3.2.MemCacheD.rc.d.sh

export PKGLOG_DIR=$OSLOG/2.3.2
export PKGLOG_INITD=$PKGLOG_DIR/initd.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

SHELL=/bin/bash
ETCDIR=/etc
LIBDIR=${DESTDIR}/lib/services
EXTDIR=${DESTDIR}${ETCDIR}
INITMODE=755
DIRMODE=755
CONFMODE=644
CURRDIR=`pwd`
INITDFILESRC1=$CURRDIR/i2.3.3.MemCacheD.init.d.sh
INITDFILEDST1=${EXTDIR}/init.d/memcached
INITDFILESRC2=$CURRDIR/i2.3.4.MemCacheD.sysconfig.txt
INITDFILEDST2=${EXTDIR}/sysconfig/memcached
INITDFILEREL=../init.d/memcached


echo "Install Init.d/rc.d ..."
echo "Install Init.d/rc.d ..." >> $OSLOG_PROCESS
echo "Install Init.d/rc.d ..." >> $PKGLOG_ERROR

cp -v $INITDFILESRC1 $INITDFILEDST1      \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
cp -v $INITDFILESRC2 $INITDFILEDST2      \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

chmod -v ${INITMODE} $INITDFILEDST1     \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc0.d/K23memcached  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc3.d/S77memcached  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR
ln -vsf  $INITDFILEREL ${EXTDIR}/rc.d/rc6.d/K23memcached  \
      >> $PKGLOG_INITD 2>> $PKGLOG_ERROR

# cat >> /etc/rc.d/rc3.d/S15runowner << "EOF"    2>> $PKGLOG_ERROR

# install -v -d -m 2755 -o memcached -g memcached /var/run/memcached

# EOF

# chmod -v 777 /etc/rc.d/rc3.d/S15runowner  \
#       >> $PKGLOG_INITD 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_INITD
unset PKGLOG_ERROR
unset PKGLOG_DIR
