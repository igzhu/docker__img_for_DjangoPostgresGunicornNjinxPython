FROM python:3.11.3-alpine3.18
WORKDIR /data
VOLUME /data
RUN apk add nginx curl
COPY ./mysite.conf /etc/nginx/http.d/mysite.local.conf
COPY ./index.html /data


EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]