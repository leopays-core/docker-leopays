# Build `leopays/leopays-dev` Docker image
> https://hub.docker.com/r/leopays/leopays-dev


```bash
VERSION=v0.1.0-rc1

docker build --no-cache --tag leopays/leopays-dev:$VERSION .
docker tag leopays/leopays-dev:$VERSION leopays/leopays-dev:latest
docker push leopays/leopays-dev:$VERSION
docker push leopays/leopays-dev:latest
```
