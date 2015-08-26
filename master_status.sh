#!/bin/bash
mysql -u root -panime<<EOFMYSQL
SHOW MASTER STATUS\G;
EOFMYSQL
