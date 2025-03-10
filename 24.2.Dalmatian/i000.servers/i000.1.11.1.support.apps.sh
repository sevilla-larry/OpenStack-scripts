# i000.1.11.1.support.apps.sh
#

# Common to all
bash b10.03.0.sh

# Common to MariaDB & Apache
bash b10.03.6.sh

# MariaDB support
bash b10.03.1.sh

# Common to PostgreSQL, ProFTPD & RabbitMQ
bash b10.03.5.sh

# PostgreSQL & RabbitMQ support
bash b10.03.2.sh

# ProFTPD & Nmap support
bash b10.03.4.sh

# common with Xorg support
bash b10.03.8.sh
bash b10.03.9.sh

# ***** Note intentionally EXcluded *****
# but seems needed by Glance
# SQLite then Python
bash b10.03.3.sh
bash g11.03.3.py.3.11.sh

# support apps for OpenStack, Nmap + deps, lsof & iptables
bash b30.03.1.sh
# support apps for OpenStack, Python Modules & Dependecies
bash b30.03.2.sh


# Python OpenStackClient support
bash i010.5.1.sh
# # Python OpenStackClient
# bash i020.5.1.sh

# support apps for Controller
bash i010.5.11.sh
