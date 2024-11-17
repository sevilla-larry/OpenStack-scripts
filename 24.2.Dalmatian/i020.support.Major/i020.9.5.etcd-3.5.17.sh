# i020.9.5.etcd-3.5.17.sh (binary Install)
#
# https://docs.openstack.org/install-guide/environment-etcd.html
#
# Notes: https://etcd.io/docs/v3.5/install/
#

export PKG="etcd-v3.5.17-linux-amd64"
export PKGDEST="/usr/local"
export PKGLOG_DIR=$LFSLOG/020.2
export PKGLOG_TAR=$PKGLOG_DIR/tar.log
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_INSTALL=$PKGLOG_DIR/install.log
export LFSLOG_PROCESS=$LFSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR


echo "Extract/Install tar..."
echo "Extract/Install tar..." >> $LFSLOG_PROCESS
echo "Extract/Install tar..." >> $PKGLOG_ERROR
tar xvf $PKG.tar.xz -C $PKGDEST > $PKGLOG_TAR 2>> $PKGLOG_ERROR

ln -sv $PKGDEST/$PKG/etcd* /usr/bin \
        > $PKGLOG_INSTALL 2>> $PKGLOG_ERROR

cat > /etc/etcd.conf.yml << "EOF"  2>> $PKGLOG_ERROR
# Begin /etc/etcd.conf.yml

# This is the configuration file for the etcd server.

# Human-readable name for this member.
name: 'VM11Controller'

# Path to the data directory.
data-dir: /var/lib/etcd

# Initial cluster configuration for bootstrapping.
initial-cluster: 'VM11Controller=http://10.0.0.11:2380'

# Initial cluster token for the etcd cluster during bootstrap.
initial-cluster-token: 'etcd-cluster-01'

# Initial cluster state ('new' or 'existing').
initial-cluster-state: 'new'

# List of this member's peer URLs to advertise to the rest of the cluster.
# The URLs needed to be a comma-separated list.
initial-advertise-peer-urls: http://10.0.0.11:2380

# List of this member's client URLs to advertise to the public.
# The URLs needed to be a comma-separated list.
advertise-client-urls: http://10.0.0.11:2379

# List of comma separated URLs to listen on for peer traffic.
listen-peer-urls: http://10.0.0.11:2380

# List of comma separated URLs to listen on for client traffic.
listen-client-urls: http://10.0.0.11:2379

# End /etc/etcd.conf.yml
EOF


unset LFSLOG_PROCESS
unset PKGLOG_INSTALL
unset PKGLOG_TAR
unset PKGLOG_ERROR
unset PKGLOG_DIR PKG
unset PKGDEST
