# i2.4.2.1.ovn-24.03.6.sh
#
# https://docs.openstack.org/neutron/2025.1/install/ovn/manual_install.html
# https://docs.ovn.org/en/latest/intro/install/general.html
#

#
# Required by:
#
#               Neutron
#

export PKG="ovn-24.03.6"
export PKGLOG_DIR=$OSLOG/2.4.2.1
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
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


echo "2. Configure ..."
echo "2. Configure ..." >> $OSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./boot.sh    > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

./configure --prefix=/usr           \
            --sysconfdir=/etc       \
            --localstatedir=/var    \
            --enable-shared         \
            --with-ovs-source=/sources/openvswitch-3.3.6    \
            >> $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $OSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

# Causing the PC Hardware (Host) to hang
# even when run as Guest
# known issue, not a bug
# echo "4. Make Check ..."
# echo "4. Make Check ..." >> $OSLOG_PROCESS
# echo "4. Make Check ..." >> $PKGLOG_ERROR
# make check TESTSUITEFLAGS=$MAKEFLAGS > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "4. Make Install ..."
echo "4. Make Install ..." >> $OSLOG_PROCESS
echo "4. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

mkdir -pv /var/{lib,log,run}/ovn            \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

ovsdb-tool create /var/lib/ovn/ovnnb_db.db  \
        /usr/share/ovn/ovn-nb.ovsschema     \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

ovsdb-tool create /var/lib/ovn/ovnsb_db.db  \
        /usr/share/ovn/ovn-sb.ovsschema     \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

#link the scripts at /usr/share/ovn/scripts
# to /usr/scripts
ln -sv  /usr/share/ovn/scripts/*    \
        /usr/scripts/               \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
