#!/bin/bash

# Install required packages
sudo apt-get update
sudo apt-get install -y apache2 mariadb-server php php-mysql libapache2-mod-php php-xml php-mbstring

# Download and extract MediaWiki
cd /tmp/
wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz
tar -xvzf /tmp/mediawiki-*.tar.gz

# Move MediaWiki files to appropriate directory
sudo mkdir -p /var/lib/mediawiki
sudo mv mediawiki-*/* /var/lib/mediawiki

# Configure MySQL/MariaDB
sudo mysql -u root <<EOF
CREATE USER 'bhuma'@'localhost' IDENTIFIED BY 'bhuma';
CREATE DATABASE bhuma;
GRANT ALL ON bhuma.* TO 'bhuma'@'localhost';
FLUSH PRIVILEGES;
EOF

# Symbolic link MediaWiki directory to Apache web directory
sudo ln -s /var/lib/mediawiki /var/www/html/mediawiki

# Enable required PHP modules
sudo phpenmod mbstring
sudo phpenmod xml

# Restart Apache
sudo systemctl restart apache2.service

# Move LocalSettings.php to MediaWiki directory
sudo mv ~/Downloads/LocalSettings.php /var/lib/mediawiki/

echo "MediaWiki installation and configuration completed."