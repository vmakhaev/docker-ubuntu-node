FROM ubuntu:14.04
MAINTAINER Vladimir Makhaev <vmakhaev@gmail.com>

ENV buildDependencies curl wget

RUN \
  apt-get update && \
  apt-get install -yqq ${buildDependencies} && \
  curl --silent --location https://deb.nodesource.com/setup_0.12 | bash - && \
  apt-get install -yqq nodejs git python build-essential libfreetype6 libfontconfig libjpeg8 libpng12-0 libicu-dev && \
  wget -O - 'https://s3.amazonaws.com/travis-phantomjs/phantomjs-2.0.0-ubuntu-14.04.tar.bz2' | tar xjf - -C ~/ && \
  mv ~/phantomjs /usr/local/bin/ && \
  npm install -g npm@2.7.5 && \
  apt-get purge -yqq ${buildDependencies} && \
  apt-get autoremove -yqq && \
  apt-get clean
