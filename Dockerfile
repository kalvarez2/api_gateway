FROM nginx:latest
RUN apt-get update && \
    apt-get install -y openssl && \
    mkdir -p ssl/ && \
    openssl genrsa -des3 -passout pass:somepasswordhere -out ssl/ndc_api_gw.pass.key 2048 && \
    openssl rsa -passin pass:somepasswordhere -in ssl/ndc_api_gw.pass.key -out ssl/ndc_api_gw.key && \
    openssl req -new -key ssl/ndc_api_gw.key -out ssl/ndc_api_gw.csr \
    -subj "/C=US/ST=Virginia/L=Dulles/O=ATPCO/OU=NDCExchange/CN=ndc.atpco.net" && \
    openssl x509 -req -days 3650 -in ssl/ndc_api_gw.csr -signkey ssl/ndc_api_gw.key -out ssl/ndc_api_gw.crt && \
    rm ssl/ndc_api_gw.pass.key && \
    echo "private key created"

COPY nginx_conf/* /etc/nginx/
COPY nginx_conf/api_conf.d/* /etc/nginx/api_conf.d/
#COPY ssl/ndc_api_gw.key /etc/ssl/private/ndc_api_gw.key;
#COPY ssl/ndc_api_gw.crt /etc/ssl/certs/ndc_api_gw.crt;
