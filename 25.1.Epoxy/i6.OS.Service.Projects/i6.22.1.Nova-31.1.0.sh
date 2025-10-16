# i6.22.1.Nova-31.1.0.sh
#
# https://docs.openstack.org/nova/2025.1/install/controller-install-ubuntu.html
#

#
# Dependencies Required:
#
#               i3.1.01 pbr-6.1.1
#               i1.1.30 SQLAlchemy-2.0.43
decorator>=4.1.0
eventlet>=0.30.1
Jinja2>=2.10
keystonemiddleware>=4.20.0
lxml>=4.5.0
Routes>=2.3.1
cryptography>=2.7
WebOb>=1.8.2
greenlet>=0.4.15
PasteDeploy>=1.5.0
Paste>=2.0.2
PrettyTable>=0.7.1
alembic>=1.5.0
netaddr>=0.7.18
paramiko>=2.7.1
iso8601>=0.1.11
jsonschema>=4.0.0
python-cinderclient>=4.0.1
keystoneauth1>=3.16.0
python-neutronclient>=7.1.0
python-glanceclient>=2.8.0
requests>=2.25.1
stevedore>=1.20.0
websockify>=0.9.0
oslo.cache>=1.26.0
oslo.concurrency>=5.0.1
oslo.config>=8.6.0
oslo.context>=3.4.0
oslo.log>=4.6.1
oslo.limit>=1.5.0
oslo.reports>=1.18.0
oslo.serialization>=4.2.0
oslo.upgradecheck>=1.3.0
oslo.utils>=8.0.0
oslo.db>=10.0.0
oslo.rootwrap>=5.15.0
oslo.messaging>=14.1.0
oslo.policy>=4.5.0
oslo.privsep>=2.6.2
oslo.i18n>=5.1.0
oslo.service>=2.8.0
rfc3986>=1.2.0
oslo.middleware>=3.31.0
psutil>=3.2.2
oslo.versionedobjects>=1.35.0
os-brick>=6.10.0
os-resource-classes>=1.1.0
os-traits>=3.3.0
os-vif>=3.1.0
castellan>=0.16.0
microversion-parse>=0.2.1
tooz>=1.58.0
cursive>=0.2.1
retrying>=1.3.3
os-service-types>=1.7.0
python-dateutil>=2.7.0
futurist>=1.8.0
openstacksdk>=4.4.0
PyYAML>=5.1

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
