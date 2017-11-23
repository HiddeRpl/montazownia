FROM ruby:2.4.2-alpine3.6
MAINTAINER mikolaj.mlodzikowski@gmail.com
RUN apk --update add alpine-sdk nodejs
RUN gem install middleman
RUN mkdir /dependencies
ADD Gemfile /dependencies
RUN cd /dependencies && bundle install
WORKDIR /app
