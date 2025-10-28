# i2.4.2.openvswitch-3.3.6.sh
#
# https://docs.openvswitch.org/en/latest/intro/install/general/
#
# Notes: https://docs.openvswitch.org/en/latest/
#

#
# Required by:
#
#               Neutron
#

export PKG="openvswitch-3.3.6"
export PKGLOG_DIR=$OSLOG/2.4.2
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
./configure --prefix=/usr           \
            --sysconfdir=/etc       \
            --localstatedir=/var    \
            --enable-shared         \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR
# Suggestion of Grok but unrecognized
#            --with-libcap-ng        \

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

#update library path (with existing /usr/local/lib)
#ldconfig >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# note /var/lib/openvswitch/pki is created by app
mkdir -pv /{etc,var/{log,run}}/openvswitch              \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
#chown -Rv root:root /var/{run,log}/openvswitch         \
#        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
ovsdb-tool create /etc/openvswitch/conf.db              \
        /usr/share/openvswitch/vswitch.ovsschema        \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

# created in procedure C
# mkdir -v /usr/scripts     \
#         >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

#link the scripts at /usr/share/openvswitch/scripts
# to /usr/scripts
ln -sv  /usr/share/openvswitch/scripts/*  \
        /usr/scripts/                     \
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
