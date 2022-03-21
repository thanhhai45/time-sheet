FROM ruby:2.7.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN gem uninstall bundler
RUN gem install bundler -v 2.2.17

WORKDIR /myapp
COPY . /myapp/
COPY  Gemfile Gemfile.lock /app/

RUN bundle install -j $(grep ^cpu\\scores /proc/cpuinfo | uniq |  awk '{print $4}')

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["bin/docker-entrypoint"]