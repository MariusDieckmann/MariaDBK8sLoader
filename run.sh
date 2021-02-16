curl -K $SQLDUMP_DL_LINK -o Spike.sql
mysql --user $MYSQL_USERNAME --password $MYSQL_PASSWORD --host $SQL_HOST < Spike.sql