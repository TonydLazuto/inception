#!/bin/sh

service mysql start && mysql -u root -p < /tmp/db.sql
