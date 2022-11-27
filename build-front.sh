#!/bin/bash

# VITE_RUBY_ASSET_HOST=127.0.0.1:4000 
# VITE_RUBY_ASSET_HOST=""

# npm install

# front served from other cdn host see config/production.rb
RAILS_ENV=production NODE_ENV=development bin/vite build --clean --mode=production --debug

if [[ $1 == '--check-asset' && -n $(grep -ro localhost:4001 public/vite/) ]]; then
  echo "assets will be served from production asset host"
fi

# rm -rf public/vite RAILS_ENV=production NODE_ENV=development bundle exec rake assets:precompile
