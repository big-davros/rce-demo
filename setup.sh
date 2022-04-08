#!/bin/bash
sudo apt-get install apache2 -y
sudo apt install php libapache2-mod-php php-gd -y
sudo systemctl restart apache2.service
sudo a2ensite default-ssl
sudo a2enmod ssl
vm_hostname="$(curl -H 'Metadata-Flavor:Google' http://169.254.169.254/computeMetadata/v1/instance/name)"
sudo echo "Page served from: $vm_hostname" | sudo tee /var/www/html/index.html
