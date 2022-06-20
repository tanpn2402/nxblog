FROM debian:bullseye-slim

WORKDIR /app

RUN apt-get update \
  && apt-get install -y python3

# CMD [ "python3", "--version" ]
CMD [ "./telegraf", "--config", "./telegraf.conf", "--config-directory", "./telegraf.d", "exec" ]