# i2.1.2.RabbitMQ-4.1.4.sh (binary Install)
#
# https://docs.openstack.org/install-guide/environment-messaging.html
#
# Notes: https://www.rabbitmq.com/docs/install-generic-unix
#

#
# Dependencies Required:
#
#				??.?? simplejson ???
#				i2.01 Erlang-27.3.4.3
#				??.?? Elixir     ???
#

export PKG="rabbitmq-server-generic-unix-4.1.4"
export PKGDEST="/usr/local"
export PKGLOG_DIR=$OSLOG/2.1.2
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "   Create the user and group..."
echo "   Create the user and group..." >> $OSLOG_PROCESS
echo "   Create the user and group..." >> $PKGLOG_ERROR
groupadd -g 121 rabbitmq    \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "rabbitmq Server"    \
        -d /var/lib/rabbitmq    \
        -g rabbitmq             \
        -s /bin/false           \
        -u 121                  \
        rabbitmq                \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

export RABBITMQ_HOME=/usr/local/rabbitmq_server-4.1.4

echo "Extract/Install tar..."
echo "Extract/Install tar..." >> $OSLOG_PROCESS
echo "Extract/Install tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz -C $PKGDEST > $PKGLOG_TAR 2>> $PKGLOG_ERROR

### use the installed directories
### in /usr/local/
### Don't create your own
### or else many errors
# install -v -dm2755 /etc/rabbitmq                 \
#          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# install -v -dm2777 /var/log/rabbitmq             \
#          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# install -v -dm775 /var/lib/rabbitmq             \
#          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# install -v -dm2775 /var/lib/rabbitmq/mnesia      \
#          >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

install -v -dm2755 -o rabbitmq -g rabbitmq      \
        /var/run/rabbitmq                       \
         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR rabbitmq:rabbitmq $RABBITMQ_HOME      \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR rabbitmq:rabbitmq /{etc,var/run}/rabbitmq    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# chown -vR rabbitmq:rabbitmq /{etc,var/{lib,log,run}}/rabbitmq    \
#         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

ln -vsf $RABBITMQ_HOME/sbin/* /usr/sbin         \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -vsf $RABBITMQ_HOME/escript/* /usr/scripts   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -vsf $RABBITMQ_HOME/etc/rabbitmq /etc/rabbitmq               \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -vsf $RABBITMQ_HOME/var/lib/rabbitmq /var/lib/rabbitmq       \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ln -vsf $RABBITMQ_HOME/var/log/rabbitmq /var/log/rabbitmq       \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_TAR
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
unset PKGDEST
