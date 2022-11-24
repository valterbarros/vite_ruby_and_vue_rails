#!/bin/bash

rm /app/tmp/pids/server.pid

[[ ! -f vite.sh ]] && bundle install && bundle exec vite install && bundle exec rails s -p 4000 -b 0.0.0.0
[[ -f vite.sh ]] && bundle install && bundle exec rails s -p 4000 -b 0.0.0.0
