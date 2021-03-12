wget -O Spike.sql $SQLDUMP_DL_LINK
sed -i Spike.sql -e 's/utf8mb4_0900_ai_ci/utf8mb4_unicode_ci/g'
mysql --user $MYSQL_USERNAME --host $SQL_HOST drop Spike
mysql --user $MYSQL_USERNAME --host $SQL_HOST Spike < Spike.sql