FROM ubuntu:14.04
MAINTAINER Vladimir Makhaev <vmakhaev@gmail.com>

ENV buildDependencies curl

RUN \
  apt-get update && \
  apt-get install -yqq ${buildDependencies} && \
  curl --silent --location https://deb.nodesource.com/setup_0.12 | bash - && \
  apt-get install -yqq nodejs git && \
  npm install -g npm@2.7.5 && \
  apt-get purge -yqq ${buildDependencies} && \
  apt-get autoremove -yqq && \
  apt-get clean
