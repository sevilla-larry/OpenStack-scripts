# i020.9.3.RabbitMQ-4.0.3.sh (source build)
#
# https://docs.openstack.org/install-guide/environment-messaging.html
#

#
# Dependencies Required:
#
#				i010.1	  simplejson-3.19.3
#				i010.2	  Erlang-26.2.5.5
#				i010.3	  Elixir-1.16.3
#				b10.09.74 libxslt-1.1.42
#				b10.49.06 xmlto-0.0.29
#

export PKG="rabbitmq-server-4.0.3"
export PKGLOG_DIR=$OSLOG/020.3
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


echo "2. Make Build ..."
echo "2. Make Build ..." >> $OSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $OSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
# initially install to a temporary directory
make install DESTDIR=/tmp/rmq	\
		> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# move the needed directory to /opt
mv -v /tmp/rmq/usr/local/lib/erlang/lib/rabbitmq_server-4.0.3	\
		/opt/rabbitmq	\
		>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# remove the temporary directory
rm -rfv /tmp/rmq

cat > /etc/profile.d/rabbitmq.sh << "EOF"  2>> $PKGLOG_ERROR
# Begin /etc/profile.d/rabbitmq.sh

pathprepend /opt/rabbitmq/sbin			PATH

# End /etc/profile.d/rabbitmq.sh
EOF


cd ..
rm -rf $PKG
unset OSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
