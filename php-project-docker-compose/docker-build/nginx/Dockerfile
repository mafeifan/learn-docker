FROM nginx:1.15
LABEL maintainer="mafeifan <mafeifan@qq.com>"

RUN mkdir -p /www

COPY conf.d/default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

# ADD mkdir.sh /opt/
# RUN chmod +x /opt/mkdir.sh && /opt/mkdir.sh
