# i6.21.2.Neutron.conf.sh
#
# Notes: https://docs.openstack.org/neutron/2025.1/configuration/index.html

#
# Required by:
#
#               i6.21.1 Neutron-26.0.1
#

export PKGLOG_DIR=$OSLOG/6.21.2
export PKGLOG_ERROR=$PKGLOG_DIR/error.log
export PKGLOG_OTHERS=$PKGLOG_DIR/others.log
export OSLOG_PROCESS=$OSLOG/process.log

rm -r $PKGLOG_DIR 2> /dev/null
mkdir $PKGLOG_DIR

ETCDIR=/etc
NEUTRONETCDIR=${ETCDIR}/neutron
NEUTRONETCDIRSAMPLE=${NEUTRONETCDIR}/sample
NEUTRONETCDIRPLUGINSML2=${NEUTRONETCDIR}/plugins/ml2
CURRDIR=`pwd`
CNFMODE=644
CNFFILESRC1=${CURRDIR}/i6.21.4.neutron.conf.txt
CNFFILEDST1=${NEUTRONETCDIR}/neutron.conf
CNFFILESRC2=${CURRDIR}/i6.21.5.ml2_conf.ini.txt
CNFFILEDST2=${NEUTRONETCDIRPLUGINSML2}/ml2_conf.ini
CNFFILESRC3=${CURRDIR}/i6.21.6.openvswitch_agent.ini.txt
CNFFILEDST3=${NEUTRONETCDIRPLUGINSML2}/openvswitch_agent.ini
CNFFILESRC1=${CURRDIR}/i6.21.7.dhcp_agent.ini.txt
CNFFILEDST1=${NEUTRONETCDIR}/dhcp_agent.ini

echo "1. Install Neutron Configuration ..."
echo "1. Install Neutron Configuration ..." >> $OSLOG_PROCESS
echo "1. Install Neutron Configuration ..." >> $PKGLOG_ERROR

cp -v   ../neutron.conf.sample                  \
        ../ml2_conf.conf.sample                 \
        ../macvtap_agent.conf.sample            \
        ../openvswitch_agent.conf.sample        \
        ../sriov_agent.conf.sample              \
        ../dhcp_agent.conf.sample               \
        ../l3_agent.conf.sample                 \
        ../metadata_agent.conf.sample           \
        ../metering_agent.conf.sample           \
        ../neutron.policy.yaml.sample           \
        ${NEUTRONETCDIRSAMPLE}                  \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

cp -v   ${CNFFILESRC1} ${CNFFILEDST1}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   ${CNFFILESRC2} ${CNFFILEDST2}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   ${CNFFILESRC3} ${CNFFILEDST3}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR
cp -v   ${CNFFILESRC4} ${CNFFILEDST4}           \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chmod -v                ${CNFMODE}              \
        ${CNFFILEDST1}  ${CNFFILEDST1}          \
        ${CNFFILEDST1}  ${CNFFILEDST1}          \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR

chown -vR neutron:neutron ${NEUTRONETCDIR}      \
        >> $PKGLOG_OTHERS 2>> $PKGLOG_ERROR


unset OSLOG_PROCESS
unset PKGLOG_OTHERS
unset PKGLOG_ERROR
unset PKGLOG_DIR
