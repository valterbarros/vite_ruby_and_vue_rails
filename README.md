# Dependencies

- Docker

# Run

```
# container

docker compose build
docker compose up

# frontend build

docker exec -it webapp /bin/bash
./build-front.sh

# open new tab and run backend build
docker exec -it webapp /bin/bash
bin/rails credentials:edit # configure it to run rails s in production mode
./build.sh

```
> open http://localhost:4001 on browser

> Rails assets(vite_javascript_tag) should be served from rails asset_host config/environments/production.rb:37(http://localhost:4001)

> vite assets should be served from page_host/vite/

# Running tests

> These tests try combinations to pass host to vite_ruby.

```
/bin/rails test test/vite_executable.rb
```
