FROM python:3.11.3-alpine3.18
WORKDIR /usr/src/app
VOLUME ./app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBUG=1
ENV SECRET_KEY=django_secretkey
ENV ALLOWED_HOSTS=localhost 127.0.0.1
#RUN pip install --upgrade pip  -- commented for escape unwanted pip modify in future
COPY ./requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8000
run ["DJANGO_SUPERUSER_USERNAME=testuser", "DJANGO_SUPERUSER_PASSWORD=testpass", \
     "DJANGO_SUPERUSER_EMAIL='admin@admin.com'", "python", "manage.py", "createsuperuser", "--noinput"]
cmd ["python", "manage.py", "runserver", "0.0.0.0:8000"]

