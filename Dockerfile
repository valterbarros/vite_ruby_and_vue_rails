FROM ruby:3.0.3-buster AS core
WORKDIR /app
COPY . .
EXPOSE 4001

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
  && apt-get update \
  && apt install -yqq -f \
  git \
  build-essential \
  libpq-dev \
  libxml2-dev \
  libxslt-dev \
  libxml2 \
  libxslt-dev \
  tzdata \
  pdftk \
  poppler-utils \
  libpdfbox-java \
  libnss3 \
  python3 \
  python3-pip \
  cabextract \
  xfonts-utils \
  redis-server \
  nodejs \
  && npm install --global yarn

RUN gem install bundler

ADD package.json /tmp/package.json
RUN cd /tmp && npm install

RUN bundle install

# FROM cypress/base AS cypress
# WORKDIR /app
# COPY . .
# RUN npm install
# RUN npm install cypress
# RUN $(npm bin)/cypress run
