## download telegraf 
From: https://portal.influxdata.com/downloads/
```
$ wget https://dl.influxdata.com/telegraf/releases/telegraf-1.22.4_linux_amd64.tar.gz

$ tar xf telegraf-1.22.4_linux_amd64.tar.gz
```
## Why dont use telegraf fom docker images
> We have to run some cmd on this image (such as Python, Bash, ...)

### Please cfg right volume on service telegraf (file > docker-compose.*.yml)
