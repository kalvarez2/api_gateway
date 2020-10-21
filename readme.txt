Build with 
sudo /usr/bin/docker build -t ndc_api_gateway .

run with:
 sudo /usr/bin/docker run -it -p 8443:443 --name ndc_api_gateway ndc_api_gateway
 or:
  sudo /usr/bin/docker run -d -p 8443:443 --name ndc_api_gateway ndc_api_gateway

Troubleshoot
Find the running container with:
 sudo /usr/bin/docker ps
Shell into the container:
 sudo /usr/bin/docker exec -it #### /bin/bash