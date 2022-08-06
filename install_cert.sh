#!/bin/bash 

HOST_FILE=hostname.txt
KEY_PATH=<key file path>
USERNAME=<ssh username>


echo > $LOG_FILE

while read line;
do 
echo
echo "**** Installing SSL certificate on $line ****"
echo 
ssh -t -T -i $KEY_PATH $USERNAME@$line <<'EOF' 

sudo mv /etc/ssl/perspectium.net/star_perspectium_net.pem /etc/ssl/perspectium.net/star_perspectium_netOLD.pem
sudo gsutil cp gs://psp_devops/star_perspectium_net.pem /etc/ssl/perspectium.net/star_perspectium_net.pem
sudo service haproxy stop
sleep 1
sudo service haproxy status
sleep 1
sudo service haproxy start
sleep 1
sudo service haproxy status 
EOF
done < $HOST_FILE 
