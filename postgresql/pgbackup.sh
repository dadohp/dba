#### Backup PostgreSQL

#!/bin/bash
#backup destination
BACKUPDIR="/root/Desktop/simpad.bak"
#postgres host
PGHOST="localhost"
#postgres user
PGUSER="postgres"
#postgres pg_dump location
PGBIN="/user/bin"
#today
TODAY=`date --date="today" +%Y%m%d`
#yesterday
YESTERDAY=`date --date="yesterday yesterday" +%Y%m%d`
#month
themonth=`date --date="today" +%Y%m`
#Ngakalin supaya tidak minta password pada saat backup - weakness!
export PGPASSWORD=mypassword

#create a full backup of the server databases
#$PGBIN/pg_dumpall -h $PGHOST -U $PGUSER | gzip > $BACKUP_DIR/fullbackup-$themonth.sql.gz

#kalau database yang ingin dibackup ada beberapa pake ini
#put the names of the databases you want to create an individual backup below
#dbs=(db1 db2 db3)
#iterate thru dbs in dbs array and backup each one
#for db in ${dbs[@]}
#do
#    $PGBIN/pg_dump -i -h $PG_HOST -U $PGUSER -F c -b -v -f $BACKUPDIR/$tTODAY-$db.backup $db
#done

#backup 1 database saja
DB=sampledb
$PGBIN/pg_dump -i -h $PG_HOST -U $PGUSER -F c -b -v -f $BACKUPDIR/$TODAY-$DB.backup $DB

#this section deletes the previous month of same day backup except for the full server backup
rm -f $BACKUPDIR/*`date --date="last month" +%Y%m%d`*.backup
