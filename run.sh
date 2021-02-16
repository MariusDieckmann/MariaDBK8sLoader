wget -O Spike.sql $SQLDUMP_DL_LINK
mysql --user $MYSQL_USERNAME --password $MYSQL_PASSWORD --host $SQL_HOST Spike < Spike.sql