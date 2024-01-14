# DISTROLESS FLAKES

Demonstrate how to use flakes to control versions of software used to build images.  

TODO:

* Convert this to a bake build.  

## Reason

We can use flakes to control installs of software more accurately.  

Here I use the technique I've used elsewhere to install then find dependencies and package up in a scratch or distroless container.  

## JQ

Install `jq`.  

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

Target `ffmpeg@5.1.1`  

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

Target `ffmpeg@5.1.2`

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

## Multitool

Shows installing multiple tools into a single flake.  

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug
# multiple tools
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=FLAKE=multitool --progress=plain -f Dockerfile.multitool --target PRODUCTION -t nix-flake-multitool .

docker run --rm -it nix-flake-multitool --version
# use /nodejs/bin/node if using distroless
docker run --rm -it --entrypoint /usr/bin/jq nix-flake-multitool --version
docker run --rm -it --entrypoint /usr/bin/ffmpeg nix-flake-multitool --version
docker run --rm -it --entrypoint /usr/bin/sox nix-flake-multitool --version

docker run --rm -it --entrypoint /busybox/sh nix-flake-multitool

dive nix-flake-multitool
```

## Multiple target versions

If we need to install versions from different parts of the channel history we can define the commitids.  

To switch versions use [nix-versions](https://lazamar.co.uk/nix-versions/), but to switch v4 to v5 you'll have to also switch packages between `ffmpeg` and `ffmpeg_5`.  

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug
# multiple tools
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=FLAKE=multitargetversions --progress=plain -f Dockerfile.multitargetversions --target PRODUCTION -t nix-flake-multitargetversions .

docker run --rm -it nix-flake-multitargetversions --version
# use /nodejs/bin/node if using distroless
docker run --rm -it --entrypoint /usr/bin/jq nix-flake-multitargetversions --version
docker run --rm -it --entrypoint /usr/bin/ffmpeg nix-flake-multitargetversions version
docker run --rm -it --entrypoint /usr/bin/sox nix-flake-multitargetversions --version

docker run --rm -it --entrypoint /busybox/sh nix-flake-multitargetversions

dive nix-flake-multitargetversions
```

## Resources

* How to Learn Nix, Part 43: My first brush with flakes [here](https://ianthehenry.com/posts/how-to-learn-nix/flakes/)  
* To find revisions of nixpkgs you want [https://lazamar.co.uk/nix-versions/](https://lazamar.co.uk/nix-versions/)  
https://nixos.wiki/wiki/Flakes