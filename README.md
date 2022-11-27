# Dependencies

- Docker

# Run

```
# container

docker compose build
docker compose up

# frontend build

docker exec -it webapp /bin/bash
bash build-front.sh

# open new tab and run backend build
docker exec -it webapp /bin/bash
bash build.sh

```
> open http://localhost:4001 on browser

> Assets should be served from rails asset_host config/environments/development.rb:37(http://127.0.0.1:4001/)

# Running tests

> These assets try combinations to pass host to vite_ruby.

```
/bin/rails test test/vite_executable.rb
```
