#!/bin/bash

line=$(grep "File" /home/admin/master_status.log | cut -d ":" -f 2 | cut -f2 -d " ")
line1=$(grep "Position" /home/admin/master_status.log | cut -d ":" -f 2 | cut -f2 -d " ")

mysqldump --host=localhost --port=3306 -uroot -panime --single-transaction --max_allowed_packet=4GB --add-drop-table --routines --create-options --events --quote-names --triggers --extended-insert --hex-blob --lock-tables --quote-names --order-by-primary --dump-date --verbose --set-gtid-purged=OFF --databases olxid > /home/admin/database/olxid.sql && cd /home/admin/database && tar -czf /home/admin/database/olxid.$line.$line1.tar.gz olxid.sql && find /home/admin/database/ -type f -mtime +6 -exec rm -- {} \;
