# i153.3.Glance-29.0.0.sh
#
# https://docs.openstack.org/glance/2024.2/install/install-ubuntu.html
#

#
# Dependencies Required:
#
#               i020.9.01 pbr-6.1.0
#               i095.9.11 defusedxml-0.7.1
#               i060.9.19 sqlalchemy-2.0.37
#               i060.9.05 eventlet-0.36.1
#               i060.9.06 PasteDeploy-3.1.0
#               i060.9.08 Routes-2.5.1
#               i060.9.02 WebOb-1.8.7
#               i060.9.20 alembic-1.13.3
#               i095.9.15 httplib2-0.22.0
#               i030.9.03 oslo.config-9.6.0
#               i080.9.02 oslo.concurrency-6.1.0
#               i030.9.05 oslo.context-5.6.0
#               i080.9.09 oslo.upgradecheck-2.4.0
#               i030.9.02 oslo.utils-7.3.0
#               i020.9.02 stevedore-5.3.0
#               i070.9.01 futurist-3.0.0
#               i090.9.05 taskflow-5.9.1
#               i020.9.04 keystoneauth1-5.8.0
#               i090.9.02 keystonemiddleware-10.7.1
#               i095.9.19 WSME-0.12.1
#               i010.9.08 prettytable-3.11.0
#               i060.9.09 paste-3.10.1
#               i010.9.24 jsonschema-4.23.0
#               i040.9.11 python-keystoneclient-5.5.0
#               i080.9.07 oslo.db-16.0.0
#               i030.9.01 oslo.i18n-6.4.0
#               i080.9.10 oslo.limit-2.5.0
#               i030.9.06 oslo.log-6.1.2
#               i080.9.06 oslo.messaging-14.9.1
#               i080.9.04 oslo.middleware-6.2.0
#               i080.9.11 oslo.reports-3.4.0
#               i080.9.08 oslo.policy-4.4.0
#               i095.9.20 retrying-1.3.4
#               i090.9.03 osprofiler-4.2.0
#               i090.9.06 glance_store-4.8.1
#               i020.9.06 debtcollector-3.0.0
#               i010.9.03 cryptography-41.0.7
#               i075.9.01 cursive-0.2.3
#               i010.9.09 iso8601-2.1.0
#               i090.9.07 os-win-5.9.0
#               i070.9.02 castellan-5.1.1
#

export PKG="glance-29.0.0"
export PKGLOG_DIR=$OSLOG/153.1
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


groupadd -g 443 glance          \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
useradd -c "glance"             \
        -g glance               \
        -s /bin/false           \
        -d /var/lib/glance      \
        -u 443                  \
        glance                  \
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
                glance                  \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

install -v -d -m755 /etc/glance                 \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/glance             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/glance/images      \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/log/glance             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   etc/glance-api.conf                     \
        /etc/glance/glance-api.conf             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
cp -v   etc/glance-api-paste.ini                \
        /etc/glance/glance-api-paste.ini        \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
chown -vR glance:glance /etc/glance             \
                        /var/lib/glance         \
                        /var/log/glance         \
    >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
# chmod 640 /etc/glance/*                         \
#     >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset SOURCES_DIR
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
