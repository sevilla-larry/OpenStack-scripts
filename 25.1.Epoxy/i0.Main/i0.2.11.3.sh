# i000.1.11.2.support.apps.sh
#

# Python OpenStackClient
# bash i050.5.1.sh

# MariaDB
# bash i050.5.2.1.sh              # MariaDB & OpenStack's MariaDB configuration
bash c11.03.9.main.app.sh       # MariaDB
bash i050.5.2.2.sh				# PyMySQL           ????

# Apache
bash c13.03.sh					# Apr & Apr-util
#bash i050.5.3.1.sh
bash c13.03.9.main.app.sh		# Apache
bash i050.5.3.2.sh				# mod-wsgi          ????

# RabbitMQ
bash i050.5.4.sh				# RabbitMQ          ????

# MemCacheD
bash i050.5.5.sh				# MemCacheD         ????

# EtcD
bash i050.5.6.sh				# EtcD              ????
