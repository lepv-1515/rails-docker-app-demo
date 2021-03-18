FROM ruby:2.5.1
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ENV BUNDLER_VERSION=2.1.1
RUN gem install bundler:2.1.1
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle _2.1.1_ install
ADD . /myapp
