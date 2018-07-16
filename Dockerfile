FROM jlesage/baseimage-gui:debian-8
MAINTAINER fresta

ENV DEBIAN_FRONTEND noninteractive LANG=en_US.UTF-8

RUN \
    apt-get update --quiet && \
    apt-get install --quiet --yes curl locales simple-scan && \
    apt-get clean && \
    locale-gen en_US.UTF-8 && \
    curl https://download2.ebz.epson.net/iscan/general/deb/x64/iscan-bundle-1.0.0.x64.deb.tar.gz | tar xz && \
    ./iscan-bundle-1.0.0.x64.deb/install.sh && \
    echo "net 172.16.10.200" >> /etc/sane.d/epkowa.conf

ENV APP_NAME="Simple-Scan"
COPY startapp.sh /startapp.sh
