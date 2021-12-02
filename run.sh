#!/bin/bash
set -e
# Small sleep to give the K8s time to recognize ready status
sleep 5
# TRAP last command to get a proper stdout/log entry for failed command.
trap 'LAST_COMMAND=$CURRENT_COMMAND; CURRENT_COMMAND=$BASH_COMMAND' DEBUG
trap 'ERROR_CODE=$?; FAILED_COMMAND=$LAST_COMMAND; echo "error: command \"$FAILED_COMMAND\" failed with exit code $ERROR_CODE"' ERR INT TERM

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
