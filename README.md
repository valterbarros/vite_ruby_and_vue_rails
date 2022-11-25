# Dependencies

- Docker

# Run

```
docker build -t vite-ruby .
docker run --name testviteruby -v ${PWD}:/app -it -p 4000:4000 vite-ruby /bin/bash
bash build.sh

docker exec -it testviteruby /bin/bash
sh build-front.sh

```
> open http://localhost:4000 on browser

> Assets should be served from rails asset_host config/environments/development.rb:37(http://127.0.0.1:4000/)
