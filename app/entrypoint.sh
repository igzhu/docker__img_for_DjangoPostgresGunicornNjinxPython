#!/bin/sh

mkdir /run/postgresql
chown postgres:postgres /run/postgresql
su postgres -c 'initdb -D /var/lib/postgresql/django_project_data'
su postgres -c 'pg_ctl start -D /var/lib/postgresql/django_project_data'
#until pg_isready
#do
#  echo "Waiting for PostgreSQL start..."
#  sleep 1
#done
su postgres -c 'psql -f create_db_and_user.sql'
#su postgres -c 'psql -c "create user postgres_user with encrypted password 'postgres_password'"'
su postgres -c 'createdb -h localhost -p 5432 -E UTF8 -O postgres_user postgres_dev'






#su -c "createuser dbuser;createdb -h localhost -p 5432 -E UTF8 -O postgres_user postgres_dev;" - postgres
#create user user_name with encrypted password 'postgres_password';
#sudo -u postgres psql -U postgres -c "create user user_name with encrypted password 'postgres_password';"
#sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'newpassword';"


nginx
python manage.py migrate
DJANGO_SUPERUSER_USERNAME=admin DJANGO_SUPERUSER_PASSWORD=admin6789admin DJANGO_SUPERUSER_EMAIL=admin@admin.com python manage.py createsuperuser --noinput
python manage.py collectstatic --noinput --clear
chown -R root:www-data /usr/src/app/static /usr/src/app/media
gunicorn django_project.wsgi:application --bind 0.0.0.0:8000

exec "$@"