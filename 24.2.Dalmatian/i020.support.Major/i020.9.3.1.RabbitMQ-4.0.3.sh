# i020.9.3.RabbitMQ-4.0.3.sh (binary Install)
#
# https://docs.openstack.org/install-guide/environment-messaging.html
#
# Notes: https://www.rabbitmq.com/docs/install-generic-unix
#

#
# Dependencies Required:
#
#				i010.1	  simplejson-3.19.3	???
#				i010.2	  Erlang-26.2.5.5
#				i010.3	  Elixir-1.16.3		???
#				b10.09.74 libxslt-1.1.42	???
#				b10.49.06 xmlto-0.0.29		???
#

export PKG="rabbitmq-server-generic-unix-4.0.3"
export PKGDEST="/usr/local"
export PKGLOG_DIR=$LFSLOG/020.3
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Extract/Install tar..."
echo "Extract/Install tar..." >> $LFSLOG_PROCESS
echo "Extract/Install tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz -C $PKGDEST > $PKGLOG_TAR 2>> $PKGLOG_ERROR

cat > /etc/profile.d/rabbitmq.sh << "EOF"  2>> $PKGLOG_ERROR
# Begin /etc/profile.d/rabbitmq.sh

pathprepend $PKGDEST/rabbitmq_server-4.0.3/sbin			PATH

# End /etc/profile.d/rabbitmq.sh
EOF


unset LFSLOG_PROCESS
unset PKGLOG_TAR
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
unset PKGDEST