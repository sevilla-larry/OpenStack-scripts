# i6.22.1.Nova-31.1.0.sh
#
# https://docs.openstack.org/nova/2025.1/install/controller-install-ubuntu.html
#

#
# Dependencies Required:
#
#               i3.1.01      pbr-6.1.1
#               i1.1.30      SQLAlchemy-2.0.43
#               i1.1.10      decorator-5.2.1
#               i1.1.36      eventlet-0.39.1
#               a.08.75      Jinja2-3.1.6
#               i4.3.07      keystonemiddleware-10.9.0
#               b10.13.24.13 lxml-6.0.2
#               i1.1.40      Routes-2.5.1
#               i1.1.03      cryptography-43.0.3 whl
#               i1.1.21      WebOb-1.8.9
#               i1.1.29      greenlet-3.2.4
#               i1.1.38      PasteDeploy-3.1.0
#               i1.1.41      Paste-3.10.1
#               i1.1.08      prettytable-3.15.1
#               i1.1.49      alembic-1.14.1
#               i1.1.16      netaddr-1.3.0
#               i1.1.73      paramiko-4.0.0
#               i1.1.09      iso8601-2.1.0 whl
#               i1.1.59      jsonschema-4.23.0
#               i5.1.07      python-cinderclient-9.7.0
#               i4.1.06      keystoneauth1-5.10.0
#               i5.1.21      python-neutronclient-11.4.0
#               i5.1.12      python-glanceclient-4.8.0
#               b30.13.24.30 Requests-2.32.5
#               i4.1.20      stevedore-5.4.1
#               i1.1.76      websockify-0.13.0
#               i4.2.31      oslo.cache-3.10.2
#               i4.1.32      oslo.concurrency-7.1.0
#               i4.1.33      oslo.config-9.7.1
#               i4.1.34      oslo.context-5.7.1
#               i4.1.38      oslo.log-7.1.0
#               i4.2.37      oslo.limit-2.6.1
#               i4.1.44      oslo.reports-3.5.1
#               i4.1.46      oslo.serialization-5.7.0
#               i4.1.48      oslo.upgradecheck-2.5.0
#               i4.1.49      oslo.utils-8.2.0
#               i4.2.35      oslo.db-17.2.1
#               i4.1.45      oslo.rootwrap-7.5.1
#               i4.1.39      oslo.messaging-16.1.0
#               i4.1.42      oslo.policy-4.5.1
#               i4.1.43      oslo.privsep-3.6.0
#               i4.1.36      oslo.i18n-6.5.1
#               i4.1.47      oslo.service-4.1.1
#               i1.1.19      rfc3986-2.0.0
#               i4.1.41      oslo.middleware-6.3.1
#               b10.13.24.17 psutil-7.0.0
#               i4.1.50      oslo.versionedobjects-3.6.0
#               i4.2.15      os-brick-6.11.0
#               i3.1.07      os-resource-classes-1.1.0
#               i3.1.08      os-traits-3.4.0
#               i4.2.17      os_vif-4.1.0
#               i4.2.01      castellan-5.2.1
#               i3.1.09      microversion-parse-2.0.0
#               i3.2.04      tooz-7.0.0
#               i1.3.01      cursive-0.2.3
#               i1.1.69      retrying-1.3.4
#               i3.1.02      os-service-types-1.7.0
#               i1.1.31      python-dateutil-2.9.0.post0
#               i3.1.05      futurist-3.0.0
#               i4.2.14      openstacksdk-4.4.0
#               b10.13.24.28 PyYAML-6.0.2
#

export PKG="nova-31.1.0"
export PKGLOG_DIR=$OSLOG/6.22.1
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

# install -v -d -m755 /etc/nova                   \
#         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m755 /etc/nova/sample            \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/nova               \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/log/nova               \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# copy the configuration samples
# to /etc/nova/sample/*
# since the whole Nova source directory
# will be removed

CONFMODE=644
NOVAETCSAMPLE=/etc/nova/sample

cd etc/nova

cp -v   logging_sample.conf                     \
        /etc/nova/logging.conf                  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cp -v   api-paste.ini                           \
        ${NOVAETCSAMPLE}/api-paste.ini.sample   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   logging_sample.conf                     \
        ${NOVAETCSAMPLE}/logging.conf.sample    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   rootwrap.conf                           \
        ${NOVAETCSAMPLE}/rootwrap.conf.sample   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -vR ${CONFMODE} /etc/nova                 \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR nova:nova /{etc,var/{lib,log}}/nova   \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
#unset SOURCES_DIR
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
