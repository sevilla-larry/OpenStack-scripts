# i111.3.Nova-30.0.0.sh
#
# https://docs.openstack.org/nova/2024.2/install/controller-install-ubuntu.html
#

export PKG="nova-30.0.0"
export PKGLOG_DIR=$OSLOG/111.1
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log
export SOURCES_DIR=$PWD

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 447 nova            \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "nova"               \
        -g nova                 \
        -s /bin/false           \
        -d /var/lib/nova        \
        -u 447                  \
        nova                    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
#        -s /usr/sbin/nologin    \

echo "2. pip3 Build ..."
echo "2. pip3 Build ..." >> $OSLOG_PROCESS
echo "2. pip3 Build ..." >> $PKGLOG_ERROR
pip3 wheel  -w dist                 \
            --no-cache-dir          \
            --no-build-isolation    \
            --no-deps               \
            $PWD                    \
            > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. pip3 Install ..."
echo "3. pip3 Install ..." >> $OSLOG_PROCESS
echo "3. pip3 Install ..." >> $PKGLOG_ERROR
pip3 install    --no-index              \
                --no-user               \
                --find-links dist       \
                --no-cache-dir          \
                nova                  \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -d -m755 /etc/nova                   \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/nova               \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/log/nova               \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   ../nova.conf.sample                     \
        /etc/nova/nova.conf                     \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   etc/nova/api-paste.ini                  \
        /etc/nova/api-paste.ini                 \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
chown -vR nova:nova /etc/nova                   \
                /var/lib/nova                   \
                /var/log/nova                   \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# chmod 640 /etc/nova/*                         \
#     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset SOURCES_DIR
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
