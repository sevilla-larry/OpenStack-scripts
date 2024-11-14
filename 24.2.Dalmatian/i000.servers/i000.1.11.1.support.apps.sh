# i000.11.Controller.sh
#
# Build Controller server
#
#
#

# Python OpenStackClient
bash i020.5.1.sh

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

# support apps for Controller
bash i010.4.11.sh

# Nmap
