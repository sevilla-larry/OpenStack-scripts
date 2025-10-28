# i2.1.2.Erlang-27.3.4.3.sh
#
# Notes: https://www.erlang.org/doc/system/install.html
#

#
# Required by:
#
#                               i2.02 RabbitMQ-4.1.4
#

export PKG="otp_src_27.3.4.3"
export PKGLOG_DIR=$OSLOG/2.1.2
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log
export SOURCES=`pwd`

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

echo "1. Extract tar..."
echo "1. Extract tar..." >> $OSLOG_PROCESS
echo "1. Extract tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.gz > $PKGLOG_TAR 2>> $PKGLOG_ERROR
cd $PKG


export ERL_TOP=`pwd`    # current directory

echo "2. Configure ..."
echo "2. Configure ..." >> $OSLOG_PROCESS
echo "2. Configure ..." >> $PKGLOG_ERROR
./configure --prefix=/usr   \
            --with-ssl      \
            > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $OSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test (too long, not executed)"
echo "4. Make Test (too long, not executed)" >> $OSLOG_PROCESS
echo "4. Make Test (too long, not executed)" >> $PKGLOG_ERROR
#make test > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

echo "5. Make Release Tests ..."
echo "5. Make Release Tests ..." >> $OSLOG_PROCESS
echo "5. Make Release Tests ..." >> $PKGLOG_ERROR
make release_tests >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

cd release/tests/test_server

$ERL_TOP/bin/erl -s ts install -s ts smoke_test batch -s init stop  \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

cp -v   $ERL_TOP/release/tests/test_server/index.html   \
        $PKGLOG_DIR/test.html                           \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

cd $ERL_TOP

echo "6. Make Install ..."
echo "6. Make Install ..." >> $OSLOG_PROCESS
echo "6. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

unset ERL_TOP


cd $SOURCES
rm -rf $PKG
unset SOURCES
unset OSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
