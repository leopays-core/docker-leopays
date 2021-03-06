# Build `leopays/builder` Docker image
> https://hub.docker.com/r/leopays/builder

## Tags
- [x] `latest` (`ubuntu-18.04`);
- [x] `ubuntu-18.04`;
- [x] `ubuntu-18.04-unpinned`;
- [ ] `ubuntu-16.04`;
- [ ] `ubuntu-16.04-unpinned`;
- [ ] `centos-7.7`;
- [ ] `centos-7.7-unpinned`;
- [ ] `amazon_linux-2`;
- [ ] `amazon_linux-2-unpinned`.

**`latest` (`ubuntu-18.04`)**
```
./leopays/.cicd/platforms/pinned/ubuntu-18.04-pinned.dockerfile
->
./docker/builder/Dockerfile
```

**Из корня репозитория**
```bash
VERSION=v0.1.0-rc1


docker build --no-cache --tag leopays/builder:ubuntu-16.04-$VERSION-unpinned --file ./.cicd/platforms/unpinned/ubuntu-16.04-unpinned.dockerfile .
docker tag leopays/builder:ubuntu-16.04-$VERSION-unpinned leopays/builder:ubuntu-16.04-unpinned
docker push leopays/builder:ubuntu-16.04-$VERSION-unpinned
docker push leopays/builder:ubuntu-16.04-unpinned

docker build --no-cache --tag leopays/builder:ubuntu-16.04-$VERSION --file ./.cicd/platforms/pinned/ubuntu-16.04-pinned.dockerfile .
docker tag leopays/builder:ubuntu-16.04-$VERSION leopays/builder:ubuntu-16.04
docker push leopays/builder:ubuntu-16.04-$VERSION
docker push leopays/builder:ubuntu-16.04


docker build --no-cache --tag leopays/builder:ubuntu-18.04-$VERSION-unpinned --file ./.cicd/platforms/unpinned/ubuntu-18.04-unpinned.dockerfile .
docker tag leopays/builder:ubuntu-18.04-$VERSION-unpinned leopays/builder:ubuntu-18.04-unpinned
docker push leopays/builder:ubuntu-18.04-$VERSION-unpinned
docker push leopays/builder:ubuntu-18.04-unpinned

docker build --no-cache --tag leopays/builder:ubuntu-18.04-$VERSION --file ./.cicd/platforms/pinned/ubuntu-18.04-pinned.dockerfile .
docker tag leopays/builder:ubuntu-18.04-$VERSION leopays/builder:ubuntu-18.04
docker tag leopays/builder:ubuntu-18.04 leopays/builder:$VERSION
docker tag leopays/builder:$VERSION leopays/builder:latest
docker push leopays/builder:ubuntu-18.04-$VERSION
docker push leopays/builder:ubuntu-18.04
docker push leopays/builder:$VERSION
docker push leopays/builder:latest
```
