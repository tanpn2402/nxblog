## `NOTICE before run must run this cmd`
```
mkdir ./data
sudo chmod -R 777 ./data
or
sudo mkdir -m 777 ./data
```

## `Dashboards`
1. https://grafana.com/grafana/dashboards/5063-nginx
2. https://grafana.com/grafana/dashboards/10585-docker-dashboard
3. https://grafana.com/grafana/dashboards/15814-docker-host
4. Linux System Overview: https://grafana.com/grafana/dashboards/2381, https://grafana.com/grafana/dashboards/1375
5. Top processes: https://grafana.com/grafana/dashboards/3387

## `folder structure`
    ./grafana
        ├── data                      # created by user with permission = 0777
        └── README.md