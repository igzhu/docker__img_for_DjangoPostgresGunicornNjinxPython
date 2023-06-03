#!/bin/sh

# postgres старт и создание db/user:
mkdir /run/postgresql
chown postgres:postgres /run/postgresql
su postgres -c 'initdb -D /var/lib/postgresql/django_project_data'
su postgres -c 'pg_ctl start -D /var/lib/postgresql/django_project_data'
#until pg_isready
#do
#  echo "Waiting for PostgreSQL start..."
#  sleep 1
#done
su postgres -c 'psql -f create_postgres_user.sql'
su postgres -c 'createdb -h localhost -p 5432 -E UTF8 -O postgres_user postgres_dev'

# nginx,django,gunicorn:
nginx
python manage.py migrate
DJANGO_SUPERUSER_USERNAME=admin DJANGO_SUPERUSER_PASSWORD=admin6789admin DJANGO_SUPERUSER_EMAIL=admin@admin.com python manage.py createsuperuser --noinput
python manage.py collectstatic --noinput --clear
chown -R root:www-data /usr/src/app/static /usr/src/app/media
gunicorn django_project.wsgi:application --bind 0.0.0.0:8000

exec "$@"