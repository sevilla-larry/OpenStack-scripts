# i6.24.1.Openstack-Placement-13.0.0.sh
#
# https://docs.openstack.org/placement/2025.1/install/install-ubuntu.html
# https://docs.openstack.org/placement/2025.1/install/from-pypi.html
#
# Configuration:
# https://docs.openstack.org/placement/2025.1/configuration/index.html
#

#
# Dependencies Required:
#
#               i3.1.01      pbr-6.1.1
#               i1.1.30      SQLAlchemy-2.0.43
#               i4.3.07      keystonemiddleware-10.9.0
#               i1.1.40      Routes-2.5.1
#               i1.1.21      WebOb-1.8.9
#               i1.1.59      jsonschema-4.23.0
#               b30.13.24.30 Requests-2.32.5
#               i4.1.32      oslo.concurrency-7.1.0
#               i4.1.33      oslo.config-9.7.1
#               i4.1.34      oslo.context-5.7.1
#               i4.1.38      oslo.log-7.1.0
#               i4.1.46      oslo.serialization-5.7.0
#               i4.1.49      oslo.utils-8.2.0
#               i4.2.35      oslo.db-17.2.1
#               i4.1.42      oslo.policy-4.5.1
#               i4.1.41      oslo.middleware-6.3.1
#               i4.1.48      oslo.upgradecheck-2.5.0
#               i3.1.07      os-resource-classes-1.1.0
#               i3.1.08      os-traits-3.4.0
#               i3.1.09      microversion-parse-2.0.0
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

# install -v -d -m755 /etc/placement              \
#         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m2755 /etc/placement/sample       \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m2777 /var/lib/placement          \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m2777 /var/log/placement          \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

chown -vR placement:placement /{etc,var/{lib,log}}/placement    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
