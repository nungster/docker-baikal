#!/bin/sh -eu

PROJECT_DB_MYSQL_MIGRATIONS_PATH=${PROJECT_DB_MYSQL_MIGRATIONS_PATH:-/db}

MYSQL="mysql
    -u${PROJECT_DB_MYSQL_USERNAME}
    -p${PROJECT_DB_MYSQL_PASSWORD}
    -h${PROJECT_DB_MYSQL_HOST}
    -D${PROJECT_DB_MYSQL_DBNAME}"

for migration in ${PROJECT_DB_MYSQL_MIGRATIONS_PATH}/*.sql ; do
  ${MYSQL} -c <$migration
done
