FROM python:3.11.3-alpine3.18

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG=1
ENV SECRET_KEY=django_secretkey1234567
ENV ALLOWED_HOSTS="hello_django localhost 127.0.0.1"

# nginx/postgres install
RUN apk update
RUN apk add --no-cache nginx postgresql

# support for postgres:
#RUN apk add --no-cache postgresql-dev gcc python3-dev musl-dev

# install requirements for Django project (gunicorn also here)
#RUN pip install --upgrade pip  -- commented for escape unwanted pip modify in the future
WORKDIR /usr/src/app
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# Nginx config
RUN rm /etc/nginx/http.d/default.conf
COPY ./nginx.conf /etc/nginx/http.d/

# copy Django project
COPY . .
EXPOSE 5432 8000 8080

VOLUME /var/lib/postgresql/

ENTRYPOINT ["./entrypoint.sh"]
