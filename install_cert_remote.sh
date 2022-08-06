#!/bin/bash 

echo "**** Installing SSL cert on `hostname -f`"

echo "Backing up  /etc/ssl/perspectium.net/star_perspectium_net.pem"
sudo mv /etc/ssl/perspectium.net/star_perspectium_net.pem /etc/ssl/perspectium.net/star_perspectium_netOLD.pem
echo 
echo "Getting new SSL cert file from Google Cloud Storage..."
sudo gsutil cp gs://psp_devops/star_perspectium_net.pem /etc/ssl/perspectium.net/star_perspectium_net.pem
echo 
echo "Stopping haproxy service"
sudo service haproxy stop
sleep 1
echo "Checking haproxy service status - should be stopped"
sudo service haproxy status
sleep 1
echo 
echo "Starting haproxy service..."
sudo service haproxy start
sleep 1
echo "Checking haproxy status"
sudo service haproxy status 

echo "Please, check /var/log/messages and /var/log/haproxy.log for more details."


