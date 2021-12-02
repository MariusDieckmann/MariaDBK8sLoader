#!/bin/bash
set -e
sleep 10
wget -O Spike.sql -q -T 10 --tries 3 $SPIKE_SQLDUMP_DL_LINK
wget -O RKIPublic.sql -q -T 10 --tries 3 $RKIPublic_SQLDUMP_DL_LINK
sed -i Spike.sql -e 's/utf8mb4_0900_ai_ci/utf8mb4_unicode_ci/g'
sed -i RKIPublic.sql -e 's/utf8mb4_0900_ai_ci/utf8mb4_unicode_ci/g'
mysql --user $MYSQL_USERNAME --host $SQL_HOST -e "DROP DATABASE IF EXISTS Spike"
mysql --user $MYSQL_USERNAME --host $SQL_HOST -e "create database Spike"
mysql --user $MYSQL_USERNAME --host $SQL_HOST -e "DROP DATABASE IF EXISTS RKIPublic"
mysql --user $MYSQL_USERNAME --host $SQL_HOST -e "create database RKIPublic"
mysql --user $MYSQL_USERNAME --host $SQL_HOST Spike < Spike.sql
mysql --user $MYSQL_USERNAME --host $SQL_HOST RKIPublic < RKIPublic.sql
