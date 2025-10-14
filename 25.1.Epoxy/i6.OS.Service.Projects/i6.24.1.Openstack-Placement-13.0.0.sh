# i6.24.1.Openstack-Placement-13.0.0.sh
#
# https://docs.openstack.org/placement/2025.1/install/install-ubuntu.html
# https://docs.openstack.org/placement/2025.1/install/from-pypi.html
#

#
# Dependencies Required:
#
#               i020.9.01 pbr-6.1.0
#               i060.9.19 sqlalchemy-2.0.37
#               i090.9.02 keystonemiddleware-10.7.1
#               i060.9.08 Routes-2.5.1
#               i060.9.02 WebOb-1.8.7
#               i010.9.24 jsonschema-4.23.0
#               b30.13.23.30 Requests-2.32.3
#               a.08.55   Setuptools-72.2.0.sh
#               i080.9.02 oslo.concurrency-6.1.0
#               i030.9.03 oslo.config-9.6.0
#               i030.9.05 oslo.context-5.6.0
#               i030.9.06 oslo.log-6.1.2
#               i030.9.04 oslo.serialization-5.5.0
#               i030.9.02 oslo.utils-7.3.0
#               i080.9.07 oslo.db-16.0.0
#               i080.9.08 oslo.policy-4.4.0
#               i080.9.04 oslo.middleware-6.2.0
#               i080.9.09 oslo.upgradecheck-2.4.0
#               i090.9.08 os-resource-classes-1.1.0
#               i090.9.09 os-traits-3.1.0
#               i090.9.10 microversion-parse-2.0.0
#

export PKG="openstack_placement-13.0.0"
export PKGLOG_DIR=$OSLOG/6.24.1
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log
export SOURCES=`pwd`
#export SOURCES_DIR=$PWD

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


groupadd -g 448 placement       \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "placement"          \
        -g placement            \
        -s /bin/false           \
        -d /var/lib/placement   \
        -u 448                  \
        placement               \
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
                openstack-placement     \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

echo "4. pyTest ..."
echo "4. pyTest ..." >> $OSLOG_PROCESS
echo "4. pyTest ..." >> $PKGLOG_ERROR
pytest >  $PKGLOG_CHECK 2>> $PKGLOG_ERROR

install -v -d -m755 /etc/placement              \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/placement          \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/log/placement          \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   ../placement.conf.sample                \
        /etc/placement/placement.conf           \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
chown -vR placement:placement /etc/placement    \
                        /var/lib/placement      \
                        /var/log/placement      \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# chmod 640 /etc/placement/*                      \
#     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
#unset SOURCES_DIR
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
