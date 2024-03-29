# README

Demonstrate using `nix` package to install into a distroless/scratch image.  

NOTES:

* This produces images with applications containing only the binaries required to run them.  
* Would be nice if `ADD` supported --from syntax as I wouldn't need to copy the files decompressed.  
* Would also be nice if the `COPY` command supported an arbitrary list of folders to copy.  
* Removes header files and manpages.  

TODO:  

* Create a more comprehensive script that copies across listed bins and dependencies.  
* --output doesn't seem to work on macosx
* slim down the ffmpeg builder and remove options not required.  

## Bake

```bash
# use bake to build all the images
docker buildx bake --metadata-file ./bake-metadata.json  
docker buildx bake --metadata-file ./bake-metadata.json --no-cache 

# iterate over built images and test --versions
while IFS=, read -r imagesha
do
    echo "IMAGE:$imagesha"
    docker run --rm -t "$imagesha"
done < <(jq -r '. | keys[] as $key | .[$key]."containerimage.digest"' ./bake-metadata.json)

# target a specific image
docker buildx bake --metadata-file ./bake-metadata.json ffmpeg6-image-scratch  
docker run --rm -it nix-ffmpeg6-scratch  --version    
dive nix-ffmpeg6-scratch
```

## Build

Build images that contain the all binaries required for the chosen tool.  

### JQ

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug
# jq
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=jq.nix --build-arg=PROGRAM_FILE=jq --progress=plain -f Dockerfile.jq --target PRODUCTION -t nix-jq .

docker run --rm -it nix-jq --version

dive nix-jq
```

### Bento4

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug
# bento4
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=bento4.nix --build-arg=PROGRAM_FILE=mp42hls --progress=plain -f Dockerfile.bento4 --target PRODUCTION -t nix-bento4 .

docker run --rm -it nix-bento4 --version
docker run --rm -it --entrypoint /busybox/sh nix-bento4

dive nix-bento4
```

### SOX

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug
# sox
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=sox.nix --build-arg=PROGRAM_FILE=sox --progress=plain -f Dockerfile.sox --target PRODUCTION -t nix-sox .

docker run --rm -it nix-sox --version
docker run --rm -it --entrypoint /busybox/sh nix-sox

dive nix-sox
```

### FFMPEG

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11
# ffmpeg
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=ffmpeg-full.nix --build-arg=PROGRAM_FILE=ffmpeg --progress=plain -f Dockerfile.ffmpeg --target PRODUCTION -t nix-ffmpeg .

docker run --rm -it nix-ffmpeg --version       

dive nix-ffmpeg
```

### FFMPEG6

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11
# ffmpeg
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=ffmpeg_6.nix --build-arg=PROGRAM_FILE=ffmpeg --progress=plain -f Dockerfile.ffmpeg6 --target PRODUCTION -t nix-ffmpeg6 .

docker run --rm -it nix-ffmpeg6 --version       

dive nix-ffmpeg6
```

### Multitool (FFMPEG & SOX)

```bash
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11
# ffmpeg
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=multitool.nix --progress=plain -f Dockerfile.multitool --target PRODUCTION -t nix-multitool .

docker run --rm -it nix-multitool --version       
docker run --rm -it --entrypoint /usr/bin/ffmpeg nix-multitool --version

dive nix-multitool
```

## Troubleshooting

If you need to troubleshoot the builds.  

```sh
# build builder target
export BASEIMAGE=scratch
export BASEIMAGE=gcr.io/distroless/nodejs16-debian11:debug

# build BUILDER targets
docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=jq.nix --build-arg=PROGRAM_FILE=jq --progress=plain -f Dockerfile.jq --target BUILDER -t nix-jq .

docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=multitool.nix --progress=plain -f Dockerfile.multitool --target BUILDER -t nix-multitool .

docker build --build-arg=baseimage=$BASEIMAGE --build-arg=NIX_FILE=bento4.nix --build-arg=PROGRAM_FILE=mp42hls --progress=plain -f Dockerfile.bento4 --target BUILDER -t nix-bento4 .

docker run --rm -it nix-bento4 --version

# exec into container
docker run --rm -it --entrypoint /bin/sh nix-jq
docker run --rm -it --entrypoint /bin/sh nix-multitool 
docker run --rm -it --entrypoint /bin/sh nix-bento4
docker run --rm -it --entrypoint /bin/sh nix-ffmpeg6

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
