#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi


WORKING_DIR="$(cd "$(dirname "$0")" && pwd)"
GRAFANA_DATA_DIR=$WORKING_DIR/grafana/data
PGADMIN_DATA_DIR=$WORKING_DIR/postgres/pgadmin
TELEGRAF_DIR=$WORKING_DIR/telegraf
TELEGRAF_VERSION=telegraf-1.22.4
TELEGRAF_REMOTE_FILE=$TELEGRAF_VERSION"_linux_amd64.tar.gz"

echo "Working dir $WORKING_DIR"
echo "Grafana data dir $GRAFANA_DATA_DIR"
echo "Postgres admin dir $PGADMIN_DATA_DIR"

### Grafana
if [ -d "$GRAFANA_DATA_DIR" ]; then
  chmod -R 777 $GRAFANA_DATA_DIR
else
  echo "Creating dir $GRAFANA_DATA_DIR ..."
  mkdir -m777 $GRAFANA_DATA_DIR
  echo "Creating dir $GRAFANA_DATA_DIR done!"
fi

### PGAdmin
if [ -d "$PGADMIN_DATA_DIR" ]; then
  chmod -R 777 $PGADMIN_DATA_DIR
else
  echo "Creating dir $PGADMIN_DATA_DIR ..."
  mkdir -m777 $PGADMIN_DATA_DIR
  echo "Creating dir $PGADMIN_DATA_DIR done!"
fi

### Telegraf
echo "Downloading telegraf ..."
if [ -d "$WORKING_DIR/$TELEGRAF_REMOTE_FILE" ]; then
  rm -f $WORKING_DIR/$TELEGRAF_REMOTE_FILE
fi
wget https://dl.influxdata.com/telegraf/releases/$TELEGRAF_REMOTE_FILE
tar -xvf $TELEGRAF_REMOTE_FILE -C $TELEGRAF_DIR/
cp $TELEGRAF_DIR/$TELEGRAF_VERSION/usr/bin/telegraf $TELEGRAF_DIR/
rm -rf $TELEGRAF_DIR/$TELEGRAF_VERSION
chmod 777 $TELEGRAF_DIR
chmod -R 777 $TELEGRAF_DIR/telegraf
rm -f $WORKING_DIR/$TELEGRAF_REMOTE_FILE


echo "---DONE---"
echo "---Let run docker compose---"