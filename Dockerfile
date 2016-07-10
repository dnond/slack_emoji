FROM ruby:2.3.1
ENV SLACK_TOKEN ${SLACK_TOKEN}

RUN mkdir -p /var/home/slack_emoji
WORKDIR /var/home/slack_emoji

ADD Gemfile Gemfile
ADD slack_emoji.gemspec slack_emoji.gemspec
ADD Gemfile.lock Gemfile.lock

RUN git init
RUN bundle install -j4

ADD . /var/home/slack_emoji

ENTRYPOINT /var/home/slack_emoji/bin/slack_emoji

