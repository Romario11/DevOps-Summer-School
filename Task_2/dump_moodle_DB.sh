#!/bin/bash
CURENT_DATE=$(date +%d%m%Y_%H%M)

mysqlservice=$(systemctl status mysql | grep running)
makedump=$(mysqldump -u root -p1103 testrs >/home/romario/dumps-sql-db/testrs-dump-$CURENT_DATE.sql)

if [[ $mysqlservice ]]; then
    echo sql runing
    $makedump
    echo dump of database has been created
else
    echo sql is not working
    echo now SQL server will be restarted
    sudo systemctl restart mysql
    ./$0
fi
