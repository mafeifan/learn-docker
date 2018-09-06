FROM nginx:1.10

ADD default.conf /etc/nginx/conf.d/default.conf
ADD nginx.conf /etc/nginx/nginx.conf
ADD mkdir.sh /opt/

RUN chmod +x /opt/mkdir.sh && /opt/mkdir.sh
