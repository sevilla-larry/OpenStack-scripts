# i153.8.Glance-29.0.0.sh
#
# https://docs.openstack.org/glance/2024.2/install/install-ubuntu.html
#

export PKG="glance-29.0.0"
export PKGLOG_DIR=$OSLOG/153
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


groupadd -g 443 glance        \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "glance"           \
        -g glance             \
        -d /var/lib/glance    \
        -s /usr/sbin/nologin    \
        -u 443                  \
        glance                \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

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
                glance                  \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -d -m755 /etc/glance               \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/glance           \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/glance/images    \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/log/glance           \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   etc/glance-api.conf                   \
        /etc/glance/glance-api.conf           \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
chown -vR glance:glance /etc/glance           \
                        /var/lib/glance       \
                        /var/log/glance       \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset SOURCES_DIR
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
