#!/bin/bash

CONTAINER_NAME=postgres.strost
DB_NAME=strost
USER=strost

## backup postgres db
var=$(date +"%FORMAT_STRING")
now=$(date +"%m_%d_%Y")
printf "%s\n" $now
today=$(date +"%Y-%m-%d")
file="./backup/db-${today}.sql"
printf "Backup file at '%s'\n" "$file"
docker exec -t $CONTAINER_NAME pg_dump -U $USER -d $DB_NAME  > "$file"
printf "Done!\n"