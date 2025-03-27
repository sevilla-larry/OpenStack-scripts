# i020.9.01.pbr-6.1.0.sh
#

#
# Required by:
#
#               i020.9.02 stevedore-5.3.0
#               i020.9.03 os-service-types-1.7.0
#               i020.9.04 keystoneauth1-5.8.0
#               i040.9.02 openstacksdk-4.0.1
#               i030.9.01 oslo.i18n-6.4.0
#               i040.9.03 osc-lib-3.1.0
#               i030.9.04 oslo.serialization-5.5.0
#               i040.9.11 python-keystoneclient-5.5.0
#               i040.9.12 python-cinderclient-9.6.0
#               i030.9.05 oslo.context-5.6.0
#               i030.9.06 oslo.log-6.1.2
#               i040.9.13 python-glanceclient-4.7.0
#               i040.9.14 python-barbicanclient-7.0.0
#               i040.9.15 python-neutronclient-11.3.1
#               i050.9.1  python-openstackclient-7.1.3
#               i060.9.21 testresources-2.0.1
#               i060.9.24 testscenarios-0.5.0
#               i080.9.02 oslo.concurrency-6.1.0
#               i080.9.04 oslo.middleware-6.2.0
#               i080.9.05 oslo.metrics-0.9.0
#               i080.9.06 oslo.messaging-14.9.1
#               i080.9.07 oslo.db-16.0.0
#               i080.9.11 oslo.reports-3.4.0
#               i070.9.02 castellan-5.1.1
#               i075.9.01 cursive-0.2.3
#               i090.9.02 keystonemiddleware-10.7.1
#               i090.9.04 automaton-3.2.0
#               i090.9.05 taskflow-5.9.1
#               i090.9.07 os-win-5.9.0
#               i090.9.08 os-resource-classes-1.1.0
#               i090.9.09 os-traits-3.1.0
#               i090.9.11 os_brick-6.9.1
#               i090.9.12 ovsdbapp-2.8.0
#               i090.9.13 os_vif-3.7.0
#               i151.3    KeyStone-26.0.0
#               i153.3    Glance-29.0.0
#               i152.3    Openstack-Placement-12.0.0
#               i152.6    osc-placement-4.5.0
#

export PKG="pbr-6.1.0"
export PKGLOG_DIR=$OSLOG/020.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


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
                pbr                     \
                > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# echo "4. pyTest ..."
# echo "4. pyTest ..." >> $OSLOG_PROCESS
# echo "4. pyTest ..." >> $PKGLOG_ERROR
# pytest >  $PKGLOG_CHECK 2>> $PKGLOG_ERROR


cd ..
rm -rf $PKG
unset OSLOG_PROCESS
unset PKGLOG_INSTALL PKGLOG_BUILD
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
