FROM alpine

EXPOSE 80

RUN apk update && \
    apk add --no-cache nginx

COPY default.conf /etc/nginx/http.d/default.conf
COPY index.html /var/www/html/index.html

CMD nginx -g 'daemon off;'
