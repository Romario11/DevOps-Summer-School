#!/bin/bash
CURENT_DATE=$(date +%d%m%Y_%H%M)

mysqldump -u root -p$PASS testrs >/home/romario/dumps-sql-db/testrs-dump-$CURENT_DATE.sql

#*/1 * * * * /home/romario/make_dump_db.sh sudo -s crontab -e

#mysqlservice = `service mysql status | grep start`
#if [[ ${#mysqlservice} ]];
#then
#`echo sql runing`
#else
