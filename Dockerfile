FROM ruby:3.0.3-buster AS core
WORKDIR /app
COPY . .
# RUN yarn install --production
# RUN npm create astro@latest
# CMD ["node"]
EXPOSE 4000

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

RUN bundle install && bundle exec vite install
