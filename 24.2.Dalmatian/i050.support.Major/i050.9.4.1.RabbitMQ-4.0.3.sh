# i050.9.4.RabbitMQ-4.0.3.sh (binary Install)
#
# https://docs.openstack.org/install-guide/environment-messaging.html
#
# Notes: https://www.rabbitmq.com/docs/install-generic-unix
#

#
# Dependencies Required:
#
#				?0??.9.?? simplejson-3.19.3	???
#				i045.9.01 Erlang-26.2.5.5
#				?045.9.02  Elixir-1.16.3
#				b10.09.74 libxslt-1.1.42	???
#				b10.49.06 xmlto-0.0.29		???
#

export PKG="rabbitmq-server-generic-unix-4.0.3"
export PKGDEST="/usr/local"
export PKGLOG_DIR=$OSLOG/050.4.1
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

export RABBITMQ_HOME=/usr/local/rabbitmq_server-4.0.3

echo "Extract/Install tar..."
echo "Extract/Install tar..." >> $OSLOG_PROCESS
echo "Extract/Install tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz -C $PKGDEST > $PKGLOG_TAR 2>> $PKGLOG_ERROR

# install -v -dm755 /etc/rabbitmq                                 \
#         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# install -v -dm777 /var/log/rabbitmq                             \
install -v -dm777 $RABBITMQ_HOME/var/log/rabbitmq               \
         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# install -v -dm775 /var/lib/rabbitmq                             \
install -v -dm775 $RABBITMQ_HOME/var/lib/rabbitmq               \
         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# install -v -dm775 /var/lib/rabbitmq/mnesia                      \
install -v -dm775 $RABBITMQ_HOME/var/lib/rabbitmq/mnesia        \
         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
chown -vR rabbitmq:rabbitmq $RABBITMQ_HOME                      \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
                # /etc/rabbitmq                                   \
                # /var/log/rabbitmq                               \
                # /var/lib/rabbitmq                               \
ln -vsf $RABBITMQ_HOME/sbin/* /usr/local/sbin                   \
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
