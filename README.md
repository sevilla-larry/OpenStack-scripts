# OpenStack-scripts
# Continuation of BLfS-Scripts (server portion)
# https://www.openstack.org/
#
# Author: Sevilla, Larry
#  eMail: sevilla.larry.prg@gmail.com
#
# Started: 2024/Nov 
#          2024/Dec/06
#               finished Python-OpenStackClient
#                           and Support Python Apps
#                               from Sources
#
# Guide based on:
# https://docs.openstack.org/install-guide/index.html
#
# Source code based on tarballs from:
# https://tarballs.opendev.org/openstack/
#
# and many Python Apps from:
# https://pypi.org/
#   for .tar.gz and .whl files, including md5sum checks
#
#
# Groupings ( numbering based on: )
# https://www.openstack.org/software/project-navigator/openstack-components#openstack-services
#
# i010 OpenStack Support Minor
# i020 OpenStack Support Major
# i030 OpenStack Oslo  support
# i040 OpenStack Oslo           (not included in the Minor group)
# i050 OpenStack Support Others
#
# i100 OpenStack Services
# i11x  Compute
# i111   Nova				Compute
# i12x  Hardware LifeCycle
# i13x  Storage
# i131   Swift				Object Store
# i132   Cinder				Block Storage
# i133   Manila				Shared filesystems
# i14x  Networking
# i141   Neutron			Networking
# i142   Octavia			Load Balancer
# i143   Designate			DNS service
# i15x  Shared Services
# i151   KeyStone			Identity service
# i152   Placement			Placement service
# i153   Glance				Image service
# i154   Barbican			Key Management
# i16x  Orchestration
# i161   Heat				Orchestration
# i17x  Workload Provisioning
# i18x  Applcation Lifecycle
# i19x  Web frontends
# i191   Horizon			Dashboard
# i192   SkyLine			Next Generation Dashboard
#
# i2xx Operations tooling
# i3xx Add-Ons to Services
# i4xx Integration Enablers
#

#
# Process
#
# if App is available in BLfS,
#
#	source - build, install
#
# elseif Python App in OpenDev / Openstack
#
#   DL from OpenDev tarballs
#
#   build & install from .tar.gz, and (optionally) test
#
#   if there is error (minimal chance)
#
#       (see PyPi)
#
#   endif
#
# elseif Python App in PyPi
#
#   build & install from .tar.gz, and (optionally) test
#
#   if there is error (some apps)
#
#       install from .whl   (big chance will be successful)
#
#   endif
#
# elseif App (not Python) has available generic unix AMD64 binary
#
#	binary download - install
#
# else
#
#	source - build, install
#
# endif
#
