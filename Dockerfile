FROM nginx:latest

RUN rm /etc/nginx/conf.d/default.conf

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/nginx.crt /etc/nginx/nginx.crt
COPY config/nginx.key /etc/nginx/nginx.key

RUN ln -s /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443
