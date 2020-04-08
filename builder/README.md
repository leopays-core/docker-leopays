# Build `leopays/builder` Docker image
> Docker Hub https://hub.docker.com/u/leopays

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
./docker-leopays/builder/Dockerfile
```

```bash
docker build --no-cache --tag leopays/builder:ubuntu-18.04 --file ./.cicd/platforms/pinned/ubuntu-18.04-pinned.dockerfile .
docker tag leopays/builder:ubuntu-18.04 leopays/builder:ubuntu-18.04-v0.1.0-rc1
docker tag leopays/builder:ubuntu-18.04 leopays/builder:latest
docker push leopays/builder:ubuntu-18.04-v0.1.0-rc1
docker push leopays/builder:ubuntu-18.04
docker push leopays/builder:latest

docker build --no-cache --tag leopays/builder:ubuntu-18.04-unpinned --file ./.cicd/platforms/unpinned/ubuntu-18.04-unpinned.dockerfile .
docker tag leopays/builder:ubuntu-18.04-unpinned leopays/builder:ubuntu-18.04-v0.1.0-rc1-unpinned
docker push leopays/builder:ubuntu-18.04-v0.1.0-rc1-unpinned
docker push leopays/builder:ubuntu-18.04-unpinned

```
