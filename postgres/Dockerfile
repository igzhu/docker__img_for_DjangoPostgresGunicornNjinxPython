FROM postgres:15.3-alpine3.18
WORKDIR /var/lib/postgresql/data/
VOLUME ./postgres_volume
ENV POSTGRES_USER=postgres_user
ENV POSTGRES_PASSWORD=postgres_password
ENV POSTGRES_DB=postgres_dev
EXPOSE 5432

# python install
RUN apk add --update --no-cache python3
RUN ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

#Django
WORKDIR /usr/src/app
VOLUME ./app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG=1
ENV SECRET_KEY=django_secretkey
ENV ALLOWED_HOSTS="localhost 127.0.0.1"

# for postgres:
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

#RUN pip install --upgrade pip  -- commented out for escape unwanted pip modify in future
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8000
#run ["DJANGO_SUPERUSER_USERNAME=testuser", "DJANGO_SUPERUSER_PASSWORD=testpass", \
#     "DJANGO_SUPERUSER_EMAIL='admin@admin.com'", "python", "manage.py", "createsuperuser", "--noinput"]
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
CMD python manage.py runserver 0.0.0.0:8000