#!/bin/bash

rm /app/tmp/pids/server.pid

bundle install && CDN_HOST=http://localhost:4001 bundle exec rails s -p 4001 -b 0.0.0.0 -e production
