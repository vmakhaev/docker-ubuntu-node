FROM ubuntu:14.04
MAINTAINER Vladimir Makhaev <vmakhaev@gmail.com>

RUN \
  apt-get update && \
  apt-get install -yqq curl \
  wget git python build-essential g++ libkrb5-dev libfreetype6 libfontconfig \
  libjpeg8 libpng12-0 libicu-dev libcurl3 libcurl3-gnutls libcurl4-openssl-dev \
  libcurl3 libcurl3-gnutls libcurl4-openssl-dev && \
  curl --silent --location https://deb.nodesource.com/setup_0.10 | bash - && \
  apt-get install -yqq nodejs && \
  wget -O - 'https://s3.amazonaws.com/travis-phantomjs/phantomjs-2.0.0-ubuntu-14.04.tar.bz2' | tar xjf - -C ~/ && \
  mv ~/phantomjs /usr/local/bin/ && \
  npm install -g npm@2.7.5 && \
  apt-get autoremove -yqq && \
  apt-get clean
