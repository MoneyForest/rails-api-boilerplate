# backend
FROM ruby:2.7.1-alpine

RUN mkdir -p /usr/src/backend/
WORKDIR /usr/src/backend/

RUN apk add --update \
  build-base \
  libxml2-dev \
  libxslt-dev \
  mysql-dev \
  && rm -rf /var/cache/apk/*

RUN apk --update add less
RUN apk add bash build-base nodejs postgresql-dev tzdata

COPY . /usr/src/backend/

# RUN bundle config disable_platform_warnings true

RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install --jobs=4 --no-cache --without test

ENV RAILS_HOST=0.0.0.0
ENV RAILS_PORT=8080

EXPOSE 8080
CMD ["rails", "s", "-p", "8080", "-b", "0.0.0.0"]
