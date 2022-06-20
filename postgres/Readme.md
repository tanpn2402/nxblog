## NOTICE before run must run this cmd
```
mkdir ./pgadmin
sudo chmod -R 777 ./pgadmin
```
## restore postgres db
cat db.sql | docker exec -i postgres.strost psql -U strost -d strost

## backup postgres db
docker exec -t postgres.strost pg_dump -U strost -d strost  > "db.sql"

## folder structure
    ./postgres
        ├── backup
        ├── data                      # created by docker
        ├── init                      # init db sql
        ├── pgadmin                   # created by user with permission = 0777
        ├── db_backup.sh              
        └── README.md