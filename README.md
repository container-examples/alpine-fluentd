# Fluentd

## Versions

Alpine : `3.6`   
Fluentd : `0.14.23`

## Plugin

Elasticsearch : `2.4.0`   
AWS S3 : `1.1.0`

In the `files/in_docker.conf` file, change the different values to suit your needs.

## Commands

Build : `docker build -t perriea/alpine-fluentd .`
Run : `docker run -d -p 24224:24224 -p 24224:24224/udp perriea/alpine-fluentd`
