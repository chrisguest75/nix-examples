# MULTI ARCHITECTURE

Demonstrate building multiple architecture containers.  

## Reason

Cloud services such as AWS have a choice of processors. The ability to target builds to various platforms allows decisions around cost and performance to be made.  

NOTES:

* This technique works for both architectures.  
* ffmpeg, sox and jq all work in arm64 and amd64.  
* We have to `filter-syscalls = false` on arm64.  This is likely a bug in Nix.  

## Multiple target versions

Quick demo of non-reproducible builds with docker containers.  

```sh
# create builders
# amd64
docker buildx create --use --driver docker-container --driver-opt network=host --name multiarch_amd64 --platform linux/amd64
# arm64
docker buildx create --use --driver docker-container --driver-opt network=host --name multiarch_arm64 --platform linux/arm64
```

```bash
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug
export BASEIMAGE=ubuntu:22.04

# amd64
docker buildx build --load --builder multiarch_amd64 --platform linux/amd64 --build-arg=baseimage=$BASEIMAGE --build-arg=FLAKE=multitargetversions --progress=plain -f Dockerfile.multitargetversions --target PRODUCTION -t nix-amd64 .

# arm64
docker buildx build --load --builder multiarch_arm64 --platform linux/arm64 --build-arg=baseimage=$BASEIMAGE --build-arg=FLAKE=multitargetversions --progress=plain -f Dockerfile.multitargetversions --target PRODUCTION -t nix-arm64 .

# test images
export IMAGENAME=nix-amd64
export IMAGENAME=nix-arm64
docker run --rm -it $IMAGENAME 
docker run --rm -it --entrypoint /usr/bin/jq $IMAGENAME --version
docker run --rm -it --entrypoint /usr/bin/ffmpeg $IMAGENAME version
docker run --rm -it --entrypoint /usr/bin/sox $IMAGENAME --version

docker run --rm -it --entrypoint /usr/bin/bash $IMAGENAME 

dive $IMAGENAME

docker images --digests
```

## Cleaning up

Destroy the builders.  

```sh
docker buildx rm multiarch_amd64
docker buildx rm multiarch_arm64
```

## Resources

