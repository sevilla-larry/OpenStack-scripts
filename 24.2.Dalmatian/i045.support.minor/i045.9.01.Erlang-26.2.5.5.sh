# i005.9.01.Erlang-26.2.5.5.sh
#

#
# Required by:
#
#				i020.9.3 RabbitMQ-4.0.3
#                               i010.9.3.Elixir-1.16.3.sh (not installed)
#

export PKG="otp_src_26.2.5.5"
export PKGLOG_DIR=$OSLOG/005.01
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
export PKGLOG_CHECK=$PKGLOG_DIR/check.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
#export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

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
./configure --prefix=/usr > $PKGLOG_CONFIG 2>> $PKGLOG_ERROR

echo "3. Make Build ..."
echo "3. Make Build ..." >> $OSLOG_PROCESS
echo "3. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "4. Make Test ..."
echo "4. Make Test ..." >> $OSLOG_PROCESS
echo "4. Make Test ..." >> $PKGLOG_ERROR
make release_tests > $PKGLOG_CHECK 2>> $PKGLOG_ERROR

cd release/tests/test_server

$ERL_TOP/bin/erl -s ts install -s ts smoke_test batch -s init stop  \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

cp -v   $ERL_TOP/release/tests/test_server/index.html   \
        $PKGLOG_DIR/test.html                           \
        >> $PKGLOG_CHECK 2>> $PKGLOG_ERROR

cd $ERL_TOP

echo "5. Make Install ..."
echo "5. Make Install ..." >> $OSLOG_PROCESS
echo "5. Make Install ..." >> $PKGLOG_ERROR
make install > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

unset ERL_TOP


cd ..
rm -rf $PKG
unset OSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD PKGLOG_CONFIG
unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
