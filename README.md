# perspectium-automation

The above script can be used to install SSL certificate on perspectum boxes. 

Please, follow the below steps:

        


## Run Locally

Clone the project

```bash
  git clone https://github.com/CelestialSystem/perspectium-automation.git
```

Go to the project directory

```bash
  cd perspectium-automation
```

Add target server IPs to hostname.txt file

```bash
  Use any text editor of your choice. Modify and save the file.
```

Modify install-cert.sh scrpt

```bash
  Replace KEY_PATH with actual path of the key file. Provide absolute path.
  Replace USERNAME with the actual remote user
  Save the file
```

Run the script
```bash
  ./install-cert.sh 
```

Notes:

1. After the script is finished running, verify the URLs manually by online SSL checkers. 
2. Also, verify that the haproxy service is running without any issues. 
   Check /var/log/messages and /var/log/haproxy.log for logs.

