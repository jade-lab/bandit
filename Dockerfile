FROM ruby:3.1-slim

WORKDIR /site

ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
     build-essential \
     git \
     pkg-config \
  && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 4000

CMD ["bash", "_tools/serve_editions.sh"]
