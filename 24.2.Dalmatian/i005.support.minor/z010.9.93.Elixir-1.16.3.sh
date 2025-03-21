# i010.9.3.Elixir-1.16.3.sh
#

#
# Dependencies Required:
#
#				i010.2	 Erlang-26.2.5.5
#

#
# Required by:
#
#				i020.9.3 RabbitMQ-4.0.3 (source build)
#
#

export PKG="elixir-1.16.3"
export PKGLOG_DIR=$OLOG/010.3
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
#export PKGLOG_CONFIG=$PKGLOG_DIR/config.log
export PKGLOG_BUILD=$PKGLOG_DIR/build.log
#export PKGLOG_CHECK=$PKGLOG_DIR/check.log
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


echo "2. Make Build ..."
echo "2. Make Build ..." >> $OSLOG_PROCESS
echo "2. Make Build ..." >> $PKGLOG_ERROR
make > $PKGLOG_BUILD 2>> $PKGLOG_ERROR

echo "3. Make Install ..."
echo "3. Make Install ..." >> $OSLOG_PROCESS
echo "3. Make Install ..." >> $PKGLOG_ERROR
# initially install to a temporary directory
make install DESTDIR=/tmp/elixir				\
		> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# move the needed directory to /opt
mv -v /tmp/elixir/usr/local/lib/elixir			\
		/opt/elixir								\
		>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# move the Man pages to /share/man/man1
mv -v /tmp/elixir/usr/local/share/man/man1/*	\
		/usr/share/man/man1						\
		>> $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

# remove the temporary directory
rm -rfv /tmp/elixir

cat > /etc/profile.d/rustc.sh << "EOF"  2>> $PKGLOG_ERROR
# Begin /etc/profile.d/rustc.sh

pathprepend /opt/elixir/bin			PATH

# End /etc/profile.d/rustc.sh
EOF


cd ..
rm -rf $PKG
unset OSLOG_PROCESS
#unset PKGLOG_OTHERS
unset PKGLOG_INSTALL PKGLOG_BUILD
#PKGLOG_CONFIG
#unset PKGLOG_CHECK
unset PKGLOG_ERROR PKGLOG_TAR
unset PKGLOG_DIR PKG
