FROM python:3.11.3-alpine3.18
WORKDIR /var/www/mysite.local
VOLUME /data
RUN apk add nginx curl
COPY ./mysite.conf /etc/nginx/http.d/mysite.local.conf
COPY ./index.html .


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]