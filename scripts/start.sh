#!/bin/sh

sed -i "s/aws_key_id AZERTY/aws_key_id ${MINIO_ACCESS_KEY}/" in_docker.conf
sed -i "s/aws_sec_key AZERTY/aws_sec_key ${MINIO_SECRET_KEY}/" in_docker.conf

exec su-exec fluentd fluentd -c /etc/fluentd/in_docker.conf