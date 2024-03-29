#!/bin/sh

# The wait script waits for the database to be ready before starting the php-fpm server.

set -e

until mysqladmin --host=mariadb --user=$WP_ADMIN --silent ping; do
  >&2 echo "mariadb is sleeping"
  sleep 10
done
  
>&2 echo "mariadb is up - executing command"