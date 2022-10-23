FROM ruby:3.1

RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && apt-get update -qq && apt-get install -y nodejs
RUN npm install -g yarn

ENV ROOT="/portalrite"

RUN mkdir ${ROOT}
WORKDIR ${ROOT}
COPY Gemfile ${ROOT}/Gemfile
COPY Gemfile.lock ${ROOT}/Gemfile.lock

RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . ${ROOT}

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD  ["rails", "server", "-b", "0.0.0.0"]


