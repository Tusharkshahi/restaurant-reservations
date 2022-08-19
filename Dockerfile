FROM ruby:2.4.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle update json
RUN gem install bundler -v '1.11.2'
RUN bundle install


CMD ["rails", "server", "-b", "0.0.0.0"]
EXPOSE 3000