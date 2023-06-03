"# docker__img_for_DjangoPostgresGunicornNjinxPython" 
Docker образ для dev/prod содержащий чистый Django проект с AlpineLinux, Python, Postgres, Gunicorn и Nginx.
По умолчанию запыскается в окружении DEV, для PROD надо передать docker inline параметр -e DEBUG=0 
(илм --env-file соответсвенно).
  docker run -p 8080:8080 <img_name> - запуск проекта http://localhost:8080
ENV параметры: DEBUG, SECRET_KEY, ALLOWED_HOSTS.
Django admin user: name - admin, password - admin6789admin.

==========================================================================
This is a simple Django dev/prod clean daft project.
Content: AlpineLinux, Django, Python, Postgres, Gunicorn, Nginx.
Env(inline '-e' or '--env_file'): DEBUG, SECRET_KEY, ALLOWED_HOSTS.
Django admin user: name - admin, password - admin6789admin.

common usage: docker run -p 8080:8080 <img_name> - then look for http://localhost:8080.
