# i050.9.5.1.MemCacheD-1.6.32.sh
#

#
# Dependencies Required:
#
#				b10.17.07 libevent-2.1.12
#

export PKG="memcached-1.6.32"
export PKGLOG_DIR=$OSLOG/050.5.1
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 441 memcached       \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "MemCacheD"          \
        -g memcached            \
        -d /var/lib/memcached   \
        -s /bin/false           \
        -u 441                  \
        memcached               \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

echo "2. Configure ..."
echo "2. Configure ..." >> $OSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr           \
            --with-libevent=/usr    \
            --sysconfdir=/etc       \
             > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $OSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $OSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Install ..."
echo "5. Make Install ..." >> $OSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cat > /etc/memcached.conf << "EOF"    2>> $PKGLOG_ERROR
# Begin /etc/memcached.conf

# Specify which IP address to listen on.
# The default is to listen on all IP addresses
# This parameter is one of the only security measures that memcached has,
# so make sure # it's listening on a firewalled interface.
-l 10.0.0.11

# End /etc/memcached.conf
EOF

#install -v -dm700 /var/lib/memcached                             \
#    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# install -v -dm755 /run/memcached                                \
#     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

mkdir -pv   /var/lib/memcached  \
            /var/run/memcached  \
            /var/log/memcached  \
     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
chown -Rv memcached:memcached   /var/lib/memcached  \
                                /var/run/memcached  \
                                /var/log/memcached  \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
