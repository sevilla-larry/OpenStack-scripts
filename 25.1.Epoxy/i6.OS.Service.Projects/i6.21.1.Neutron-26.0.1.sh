# i6.21.1.Neutron-26.0.1.sh
#
# https://docs.openstack.org/neutron/2025.1/install/controller-install-ubuntu.html
#

#
# Dependencies Required:
#
#               i3.1.01      pbr-6.1.1
#               i1.1.41      Paste-3.10.1
#               i1.1.38      PasteDeploy-3.1.0
#               i1.1.40      Routes-2.5.1
#               i3.1.04      debtcollector-3.0.0
#               i1.1.10      decorator-5.2.1
#               i1.1.36      eventlet-0.39.1
#               i1.1.81      pecan-1.6.0
#               i1.1.61      httplib2-0.22.0
#               b30.13.24.30 Requests-2.32.5
#               a.08.75      Jinja2-3.1.6
#               i4.3.07      keystonemiddleware-10.9.0
#               i1.1.16      netaddr-1.3.0
neutron-lib>=3.17.0
#               i5.1.21      python-neutronclient-11.4.0
#               i1.1.63      tenacity-9.0.0
#               i1.1.30      SQLAlchemy-2.0.43
#               i1.1.21      WebOb-1.8.9
#               i4.1.06      keystoneauth1-5.10.0
#               i1.1.49      alembic-1.14.1
#               i4.1.20      stevedore-5.4.1
#               i4.2.31      oslo.cache-3.10.2
#               i4.1.32      oslo.concurrency-7.1.0
#               i4.1.33      oslo.config-9.7.1
#               i4.1.34      oslo.context-5.7.1
#               i4.2.35      oslo.db-17.2.1
#               i4.1.36      oslo.i18n-6.5.1
#               i4.1.38      oslo.log-7.1.0
#               i4.1.39      oslo.messaging-16.1.0
#               i4.1.41      oslo.middleware-6.3.1
#               i4.1.42      oslo.policy-4.5.1
#               i4.1.43      oslo.privsep-3.6.0
#               i4.1.44      oslo.reports-3.5.1
#               i4.1.45      oslo.rootwrap-7.5.1
#               i4.1.46      oslo.serialization-5.7.0
#               i4.1.47      oslo.service-4.1.1
#               i4.1.48      oslo.upgradecheck-2.5.0
#               i4.1.49      oslo.utils-8.2.0
#               i4.1.50      oslo.versionedobjects-3.6.0
#               i3.2.02      osprofiler-4.2.0
os-ken>=3.0.0
#               i3.1.07      os-resource-classes-1.1.0
#               i1.1.78      ovs-3.5.2
#               i4.2.19      ovsdbapp-2.11.0
#               b10.13.24.17 psutil-7.0.0
#               i1.1.79      pyroute2-0.8.1
#               i1.1.52      pyOpenSSL-24.2.1
python-novaclient>=9.1.0
#               i4.2.14      openstacksdk-4.4.0
python-designateclient>=2.7.0
#               i4.2.17      os_vif-4.1.0
#               i3.1.05      futurist-3.0.0
#               i3.2.04      tooz-7.0.0

export PKG="neutron-26.0.1"
export PKGLOG_DIR=$OSLOG/6.21.1
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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


cd $SOURCES
rm -rf $PKG
unset SOURCES
#unset SOURCES_DIR
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
