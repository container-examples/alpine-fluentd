# Fluentd [![Build Status](https://drone.aurelienperrier.com/api/badges/Docker-example/alpine-fluentd/status.svg?branch=master)](https://drone.aurelienperrier.com/Docker-example/alpine-fluentd)

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
