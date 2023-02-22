# DISTROLESS FLAKES

Demonstrate how to use flakes to control versions of software used to build images.  

## Reason

We can use flakes to control installs of software more accurately.  Here I use the technique I've used elsewhere to install then find dependencies and package up in a scratch or distroless container.   

## JQ

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug

# jq
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=FLAKE=jq --build-arg=PROGRAM_FILE=jq --progress=plain -f Dockerfile.jq --target PRODUCTION -t nix-flake-jq .

docker run --rm -it nix-flake-jq --version
# use /nodejs/bin/node if using distroless
docker run --rm -it --entrypoint /busybox/sh  nix-flake-jq 

dive nix-flake-jq
```

## FFMPEG 5.1.1

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug
# ffmpeg
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=FLAKE=ffmpeg5.1.1 --build-arg=PROGRAM_FILE=ffmpeg --progress=plain -f Dockerfile.ffmpeg.5.1.1 --target PRODUCTION -t nix-flake-ffmpeg5-1-1 .

docker run --rm -it nix-flake-ffmpeg5-1-1 --version
# use /nodejs/bin/node if using distroless
docker run --rm -it --entrypoint /busybox/sh nix-flake-ffmpeg5-1-1

dive nix-flake-ffmpeg5-1-1
```

## FFMPEG 5.1.2

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug
# ffmpeg
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=FLAKE=ffmpeg5.1.2 --build-arg=PROGRAM_FILE=ffmpeg --progress=plain -f Dockerfile.ffmpeg.5.1.2 --target PRODUCTION -t nix-flake-ffmpeg5-1-2 .

docker run --rm -it nix-flake-ffmpeg5-1-2 --version
# use /nodejs/bin/node if using distroless
docker run --rm -it --entrypoint /busybox/sh nix-flake-ffmpeg5-1-2

dive nix-flake-ffmpeg5-1-2
```

## Resources 

* How to Learn Nix, Part 43: My first brush with flakes [here](https://ianthehenry.com/posts/how-to-learn-nix/flakes/)  
