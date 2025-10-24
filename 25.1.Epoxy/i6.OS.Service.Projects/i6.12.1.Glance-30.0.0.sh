# i6.12.1.Glance-30.0.0.sh
#
# https://docs.openstack.org/glance/2025.1/install/install-ubuntu.html
#
# Configuration:
# https://docs.openstack.org/glance/2025.1/configuration/index.html
#

#
# Dependencies Required:
#
#               i3.1.01 pbr-6.1.1
#               i1.1.51 defusedxml-0.7.1
#               i1.1.30 SQLAlchemy-2.0.43
#               i1.1.36 eventlet-0.39.1
#               i1.1.38 PasteDeploy-3.1.0
#               i1.1.40 Routes-2.5.1
#               i1.1.21 WebOb-1.8.9
#               i1.1.49 alembic-1.14.1
#               i1.1.61 httplib2-0.22.0
#               i4.1.33 oslo.config-9.7.1
#               i4.1.32 oslo.concurrency-7.1.0
#               i4.1.34 oslo.context-5.7.1
#               i4.1.48 oslo.upgradecheck-2.5.0
#               i4.1.49 oslo.utils-8.2.0
#               i4.1.20 stevedore-5.4.1
#               i3.1.05 futurist-3.0.0
#               i4.2.22 taskflow-5.12.0
#               i4.1.06 keystoneauth1-5.10.0
#               i4.2.07 keystonemiddleware-10.9.0
#               i1.1.68 WSME-0.12.1
#               i1.1.08 prettytable-3.15.1
#               i1.1.41 paste-3.10.1
#               i1.1.59 jsonschema-4.23.0
#               i5.1.16 python-keystoneclient-5.6.0
#               i4.2.35 oslo.db-17.2.1
#               i4.1.36 oslo.i18n-6.5.1
#               i4.2.37 oslo.limit-2.6.1
#               i4.1.38 oslo.log-7.1.0
#               i4.1.39 oslo.messaging-16.1.0
#               i4.1.41 oslo.middleware-6.3.1
#               i4.1.44 oslo.reports-3.5.1
#               i4.1.42 oslo.policy-4.5.1
#               i1.1.69 retrying-1.3.4
#               i3.2.02 osprofiler-4.2.0
#               i4.2.04 glance_store-4.9.1
#               i3.1.04 debtcollector-3.0.0
#               i1.1.03 cryptography-43.0.3
#               i1.3.01 cursive-0.2.3
#               i4.2.01 castellan-5.2.1
#

export PKG="glance-30.0.0"
export PKGLOG_DIR=$OSLOG/6.12.1
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
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

install -v -d -m755 /etc/glance/{sample,metadefs}       \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
# install -v -d -m755 /etc/glance/sample          \
#         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
# install -v -d -m755 /etc/glance/metadefs        \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
# install -v -d -m777 /var/lib/glance             \
#         >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/lib/glance/images      \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m777 /var/log/glance             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR
install -v -d -m755 /var/run/glance             \
        >> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# copy the configuration samples
# to /etc/glance/sample/*
# since the whole Glance source directory
# will be removed

DIRMODE=755
CONFMODE=644
GLANCEETCSAMPLE=/etc/glance/sample

cd etc

cp -v   glance-api-paste.ini                                            \
        /etc/glance/glance-api-paste.ini                                \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   glance-api-paste.ini                                            \
        ${GLANCEETCSAMPLE}/glance-api-paste.ini.sample                  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   glance-api.conf                                                 \
        ${GLANCEETCSAMPLE}/glance-api.conf.sample                       \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   glance-cache.conf                                               \
        ${GLANCEETCSAMPLE}/glance-cache.conf.sample                     \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   glance-image-import.conf.sample                                 \
        ${GLANCEETCSAMPLE}/glance-image-import.conf.sample              \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   glance-manage.conf                                              \
        ${GLANCEETCSAMPLE}/glance-manage.conf.sample                    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   glance-policy-generator.conf                                    \
        ${GLANCEETCSAMPLE}/glance-policy-generator.conf.sample          \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   glance-scrubber.conf                                            \
        ${GLANCEETCSAMPLE}/glance-scrubber.conf.sample                  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   glance-swift.conf.sample                                        \
        ${GLANCEETCSAMPLE}/glance-swift.conf.sample                     \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   ovf-metadata.json.sample                                        \
        ${GLANCEETCSAMPLE}/ovf-metadata.json.sample                     \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   property-protections-policies.conf.sample                       \
        ${GLANCEETCSAMPLE}/property-protections-policies.conf.sample    \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   property-protections-roles.conf.sample                          \
        ${GLANCEETCSAMPLE}/property-protections-roles.conf.sample       \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   schema-image.json                                               \
        ${GLANCEETCSAMPLE}/schema-image.json.sample                     \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cp -v   metadefs/* /etc/glance/metadefs                                 \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -vR ${DIRMODE} /etc/glance                        \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR glance:glance /{etc,var/{lib,log,run}}/glance \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
