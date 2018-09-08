FROM nginx:1.10

RUN mkdir -p /www/public

ADD conf.d/default.conf /etc/nginx/conf.d/default.conf
ADD nginx.conf /etc/nginx/nginx.conf
# ADD mkdir.sh /opt/

# RUN chmod +x /opt/mkdir.sh && /opt/mkdir.sh
