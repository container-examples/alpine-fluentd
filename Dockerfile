FROM alpine:3.7

LABEL MAINTAINER="Aurelien PERRIER <a.perrier89@gmail.com>"
LABEL APP="fluentd"
LABEL APP_VERSION="0.14.23"
LABEL APP_REPOSITORY="https://github.com/fluent/fluentd/releases"

ENV TIMEZONE Europe/Paris
ENV FLUENTD_VERSION 0.14.23
ENV MINIO_ACCESS_KEY minio-access
ENV MINIO_SECRET_KEY minio-secret

# Installing dependencies
RUN apk --update add --no-cache ruby ruby-irb
RUN apk --update add --no-cache --virtual .build-deps build-base ruby-dev

# Work path
WORKDIR /scripts

# Install Fluentd + plugins S3 & ES
RUN echo 'gem: --no-document' >> /etc/gemrc && \ 
        gem install oj && \
        gem install json && \
        gem install fluentd -v ${FLUENTD_VERSION} && \
        gem install fluent-plugin-s3 && \
        gem install fluent-plugin-elasticsearch && \
        apk del .build-deps

# Coping config & scripts
COPY ./files/in_docker.conf /etc/fluentd/in_docker.conf
COPY ./scripts/start.sh start.sh

EXPOSE 24224 24224/udp

ENTRYPOINT [ "./start.sh" ]