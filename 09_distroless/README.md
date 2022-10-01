# README

Demonstrate using `nix` package to install into a distroless/scratch image.  

NOTES:

* This produces images with applications containing only the binaries required to run them.  
* Would be nice if `ADD` supported --from syntax as I wouldn't need to copy the files decompressed.  
* Would also be nice if the `COPY` command supported an arbitrary list of folders to copy.  

TODO:  

* --output doesn't seem to work on macosx
* complete the generic builder, improve the ffmpeg one.  
* slim down the ffmpeg builder and remove options not required.  

## Build

Build images that contain the all binaries required for the chosen tool.  

### JQ

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs:16 
# jq
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=jq.nix --build-arg=PROGRAM_FILE=jq --progress=plain -f Dockerfile.jq --target PRODUCTION -t nix-jq .

docker run --rm -it nix-jq --version

dive nix-jq
```

### SOX

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs:16 
# sox
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=sox.nix --build-arg=PROGRAM_FILE=sox --progress=plain -f Dockerfile.sox --target PRODUCTION -t nix-sox .

docker run --rm -it nix-sox --version

dive nix-sox
```

### FFMPEG

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs:16 
# ffmpeg
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=ffmpeg-full.nix --build-arg=PROGRAM_FILE=ffmpeg --progress=plain -f Dockerfile.ffmpeg --target PRODUCTION -t nix-ffmpeg .

docker run --rm -it nix-ffmpeg --version       

dive nix-ffmpeg
```

## Troubleshooting

If you need to troubleshoot the builds.  

```sh
# build builder target
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs:16 

docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=jq.nix --build-arg=PROGRAM_FILE=jq --progress=plain -f Dockerfile.jq --target BUILDER -t nix-jq .

# exec into container
docker run --rm -it --entrypoint /bin/sh nix-jq

# show sizes
dive nix-jq
```

## Resources

* Add a tips/tricks doc to the README with info on how to do common Dockerfile tasks [here](https://github.com/GoogleContainerTools/distroless/issues/13)
* Documentation for gcr.io/distroless/base and gcr.io/distroless/static [here](https://github.com/GoogleContainerTools/distroless/tree/main/base)
* [Nix-dev] Generating nixos-compatible binaries? And bootstrapped packages. [here](https://releases.nixos.org/nix-dev/2016-August/021431.html)
* On-demand linked libraries for Nix [here](https://fzakaria.com/2020/11/18/on-demand-linked-libraries-for-nix.html)
* nix-alien [here](https://github.com/thiagokokada/nix-alien)
* nix-autobahn [here](https://github.com/Lassulus/nix-autobahn)
* A files database for nixpkgs [here](https://github.com/bennofs/nix-index)
