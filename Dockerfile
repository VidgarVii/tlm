FROM ruby:2.6.2
LABEL Pavel Rebrov

WORKDIR /app
COPY ./ .

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends nodejs
RUN gem install bundler
RUN bundle install
RUN cp config/database.yml.sample config/database.yml

CMD rails db:migrate && rails server -b 0.0.0.0
