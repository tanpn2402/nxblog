
## `Folder structure`

    .
    ├── nextjs                      # Nextjs project
    ├── nginx                       # nginx configs
    ├── postgres                    # postgres db folder
    ├── strapi                      # Strapi project
    ├── influxdb                    # influxdb project
    ├── grafana                     # grafana project
    ├── telegraf                    # telegraf project
    ├── .env              
    ├── docker-compose.develop.yml              
    └── README.md

## `Steps`
1. Run startup.sh with root to init project
```
$ sudo startup.sh
```
2. Run docker-compose on local
```
$ docker-compose -f docker-compose.develop.yml up -d
```
3. Access all resources
```
1. Blog main page           : http://localhost:<NGINX_PORT>
2. Blog CRM page            : http://localhost:<STRAPI_PORT>
3. Check influxDB status    : http://localhost:<INFLUXDB_PORT>/health
4. Check nginx status       : http://localhost:<NGINX_PORT>/status
4. Grafana home             : http://localhost:<GRAFANA_PORT>
```

## `References`
1. https://linuxhint.com/docker_compose_memory_limits/#:~:text=The%20MEM%20USAGE%2FLIMIT%20is,start%20writing%20docker%2Dcompose%20scripts.
2. https://sematext.com/guides/docker-logs/
