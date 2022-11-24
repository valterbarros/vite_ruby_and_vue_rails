#! /bin/sh
# http://localhost:3000/vite-dev/assets/application.49784953.css
# /vite-dev/assets/application.49784953.css
function build() {
  VITE_RUBY_ASSETS_DIR="assets" \
  VITE_RUBY_AUTO_BUILD="false" \
  VITE_RUBY_BUILD_CACHE_DIR="/Users/valterbarros/projects/js/tavola/tmp/cache/vite" \
  VITE_RUBY_PUBLIC_OUTPUT_DIR="vite-dev" \
  # VITE_RUBY_CONFIG_PATH="./.vscode/vite.json" \
  VITE_RUBY_DEV_SERVER_CONNECT_TIMEOUT="30" \
  VITE_RUBY_PUBLIC_DIR="public" \
  VITE_RUBY_ENTRYPOINTS_DIR="entrypoints" \
  VITE_RUBY_SOURCE_CODE_DIR="app/javascript" \
  VITE_RUBY_SKIP_COMPATIBILITY_CHECK="false" \
  VITE_RUBY_HOST="0.0.0.0" \
  VITE_RUBY_ASSET_HOST="localhost:3000" \
  VITE_RUBY_HTTPS="false" \
  VITE_RUBY_PORT="8081" \
  VITE_RUBY_HIDE_BUILD_CONSOLE_OUTPUT="false" \
  VITE_RUBY_VITE_BIN_PATH="node_modules/.bin/vite" \
  VITE_RUBY_BASE="" \
  VITE_RUBY_SSR_BUILD_ENABLED="false" \
  VITE_RUBY_SSR_ENTRYPOINT="~/ssr/ssr.{jstsjsxtsx}" \
  VITE_RUBY_SSR_OUTPUT_DIR="/Users/valterbarros/projects/js/tavola/public/vite-ssr" \
  VITE_RUBY_MODE="development" \
  VITE_RUBY_ROOT="/Users/valterbarros/projects/js/tavola" \
  SKIP_VITE_LEGACY="true" \
  node_modules/.bin/vite build --mode development -c ./.vscode/vite.config.js
}

function dev() {
  VITE_RUBY_ASSETS_DIR="assets" \
  VITE_RUBY_AUTO_BUILD="false" \
  VITE_RUBY_BUILD_CACHE_DIR="/Users/valterbarros/projects/js/tavola/tmp/cache/vite" \
  VITE_RUBY_PUBLIC_OUTPUT_DIR="vite-dev" \
  # VITE_RUBY_CONFIG_PATH="./.vscode/vite.json" \
  VITE_RUBY_DEV_SERVER_CONNECT_TIMEOUT="30" \
  VITE_RUBY_PUBLIC_DIR="public" \
  VITE_RUBY_ENTRYPOINTS_DIR="entrypoints" \
  VITE_RUBY_SOURCE_CODE_DIR="app/javascript" \
  VITE_RUBY_SKIP_COMPATIBILITY_CHECK="false" \
  VITE_RUBY_HOST="localhost" \
  VITE_RUBY_HTTPS="false" \
  VITE_RUBY_PORT="8081" \
  VITE_RUBY_HIDE_BUILD_CONSOLE_OUTPUT="false" \
  VITE_RUBY_VITE_BIN_PATH="node_modules/.bin/vite" \
  VITE_RUBY_BASE="" \
  VITE_RUBY_SSR_BUILD_ENABLED="false" \
  VITE_RUBY_SSR_ENTRYPOINT="~/ssr/ssr.{jstsjsxtsx}" \
  VITE_RUBY_SSR_OUTPUT_DIR="/Users/valterbarros/projects/js/tavola/public/vite-ssr" \
  VITE_RUBY_MODE="development" \
  VITE_RUBY_ROOT="/Users/valterbarros/projects/js/tavola" \
  SKIP_VITE_LEGACY="true" \
  node_modules/.bin/vite --mode development -c ./.vscode/vite.config.js $1 --clearScreen false -d
}

# mv node_modules node_modules_docker && mv node_modules_local node_modules

if [[ $1 == '--dev' ]]; then
  dev $2
fi

if [[ $1 =~ ^-- && $1 == '--build' ]]; then
  build
fi
