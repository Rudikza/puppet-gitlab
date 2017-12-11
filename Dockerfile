FROM ruby:2.4-alpine
MAINTAINER Tobias Brunner <tobias.brunner@vshn.ch>

ENV PUPPET_VERSION "~> 5.3.3"
RUN apk add --no-cache git bash alpine-sdk && \
    adduser -S puppet && \
    mkdir /home/puppet/gitlab && \
    chown -R puppet /home/puppet

WORKDIR /home/puppet/gitlab
COPY Gemfile /home/puppet/gitlab

#USER puppet
RUN bundle install --without development system_tests
