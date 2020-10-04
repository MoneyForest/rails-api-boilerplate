FROM ruby:2.7.1-alpine

RUN mkdir -p /usr/src/rails-api-boilerplate
WORKDIR /usr/src/rails-api-boilerplate

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  mysql-dev \
  && rm -rf /var/cache/apk/*

RUN apk --update add less

RUN apk add bash build-base nodejs postgresql-dev tzdata

COPY . /usr/src/rails-api-boilerplate/

# RUN bundle config disable_platform_warnings true

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

ENV RAILS_HOST=0.0.0.0
ENV RAILS_PORT=8080

EXPOSE 8080

# Start the main process
CMD ["rails", "s", "-p", "8080", "-b", "0.0.0.0"]
