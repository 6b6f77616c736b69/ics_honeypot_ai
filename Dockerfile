FROM ruby:3.1

# Install Jekyll dependencies
RUN apt-get update && \
    apt-get install -y build-essential git nodejs && \
    gem install bundler

WORKDIR /srv/jekyll

COPY . /srv/jekyll

# Install Jekyll and dependencies
RUN bundle install

EXPOSE 4000 35729

CMD ["bundle", "exec", "jekyll", "serve", "--watch", "--force_polling", "--verbose", "--host", "0.0.0.0"]
