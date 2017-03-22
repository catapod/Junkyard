FROM ruby:2.4

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /transfer
WORKDIR /transfer
ADD Gemfile /transfer/Gemfile
ADD Gemfile.lock /transfer/Gemfile.lock
RUN bundle install
ADD . /transfer
