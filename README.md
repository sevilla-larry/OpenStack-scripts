# OpenStack-scripts
# Continuation of BLfS-Scripts (server portion)
# https://www.openstack.org/
#
# Author: Sevilla, Larry
#  eMail: sevilla.larry.prg@gmail.com
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

# 24.2 Dalmatian
#
# Started: 2024/Nov 
#          2024/Dec/06
#               finished Python-OpenStackClient
#                           and Support Python Apps
#                               from Sources
# only finished Nova at Controller
# Stopped 2025/Mar due to time constrained

# i010 Oslo and OpenStack Support Apps - 1
# i020 Openstack sub-Services - 1
# i025 Oslo and OpenStack Support Apps - 2
# i030 Oslo Apps - 1
# i040 Openstack sub-Services - 2

# i045 OpenStack Support Minor
# i050 OpenStack Support Major

# i060 Oslo and OpenStack Support Apps - 3
# i070 Openstack sub-Services - 3
# i075 Oslo and OpenStack Support Apps - 4
# i080 Oslo Apps - 2
# i090 Openstack sub-Services - 4

# i095 Other Support Apss

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
# 25.1 Epoxy
# Started: 2025/Apr
#
# numbering based on:
#   https://releases.openstack.org/epoxy/index.html
#
# i0 { caller }
# i1 OpenStack and Oslo Support Apps 
# i2 OpenStack Support Apps - Major
# i3 { reserve }
# i4 Library Projects
# i5 Service Client Projects
# i6 Service Projects
# i7 Horizon Plugins
# i8 Other Projects
# i9 Tempest Plugins





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
#   Source build & install from .tar.gz, and (optionally) test
#
#   if there is error (minimal chance)
#
#       (see PyPi)
#
#   endif
#
# elseif Python App in PyPi
#
#   Source build & install from .tar.gz, and (optionally) test
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
