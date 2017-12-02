FROM alpine:3.6

LABEL MAINTAINER="Aurelien PERRIER <a.perrier89@gmail.com>"
LABEL APP="fluentd"
LABEL APP_VERSION="0.14.23"
LABEL APP_REPOSITORY="https://github.com/fluent/fluentd/releases"
LABEL APP_DESCRIPTION="logging"

ENV TIMEZONE Europe/Paris
ENV FLUENTD_VERSION 0.14.23

# Installing dependencies
RUN apk --update add --no-cache ruby ruby-irb
RUN apk --update add --no-cache --virtual .build-deps \
    build-base \
    wget \
    tar \
    ruby-dev

RUN mkdir -p /var/log/td-agent

WORKDIR /root

RUN echo 'gem: --no-document' >> /etc/gemrc && \ 
        gem install oj -v 2.18.3 && \
        gem install json -v 2.1.0 && \
        gem install fluentd -v ${FLUENTD_VERSION} && \
        gem install fluent-plugin-s3 && \
        gem install fluent-plugin-elasticsearch && \
        apk del .build-deps

COPY ./files/*.conf .
COPY ./scripts/*.sh .

EXPOSE 24224 24224/udp

ENTRYPOINT [ "./start.sh" ]