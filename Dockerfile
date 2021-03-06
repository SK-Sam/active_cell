FROM rubylang/ruby:2.5.3-bionic
EXPOSE 4567

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile .

RUN bundle install

COPY . /usr/src/app

CMD ruby all_tests.rb