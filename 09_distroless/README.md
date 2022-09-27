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

### Scratch (jq)

```sh
# build the packages 
docker build --no-cache --progress=plain -f Dockerfile.scratch --target BUILDER -t nix-scratch-builder .    

# show the dependencies that need to be copied 
#docker build --no-cache --progress=plain -f Dockerfile.scratch --target LDD -t nix-scratch .    
docker run --rm -it --entrypoint /bin/sh --name nix-scratch-builder nix-scratch-builder  
docker create --name nix-scratch-builder nix-scratch-builder
mkdir -p ./out
docker cp nix-scratch-builder:/scratch/jq_libs_paths.txt ./out
docker stop nix-scratch-builder; docker rm nix-scratch-builder  

# build final scratch image
docker build --no-cache --progress=plain -f Dockerfile.scratch --target PRODUCTION -t nix-scratch-final .    
```

### Distroless (sox)

```sh
# build the packages 
docker build --no-cache --progress=plain -f Dockerfile.distroless --target BUILDER -t nix-distroless-builder .    
# show the dependencies that need to be copied 
#docker build --no-cache --progress=plain -f Dockerfile.distroless --target LDD -t nix-distroless .    
docker run --rm -it --entrypoint /bin/sh --name nix-distroless-builder nix-distroless-builder  
docker create --name nix-distroless-builder nix-distroless-builder
mkdir -p ./out
docker cp nix-distroless-builder:/scratch/sox_libs_paths.txt ./out
docker stop nix-distroless-builder; docker rm nix-distroless-builder  

# build final scratch image
docker build --no-cache --progress=plain -f Dockerfile.distroless --target PRODUCTION -t nix-distroless-final .

# create lib copy directives
cat ./out/sox_libs_paths.txt | awk 'NF == 1 { {print "COPY --from=BUILDER " $1 " " $1} }'
```

## Run

Test the build images.  

```sh
# run to prove jq works
docker run --rm -it nix-scratch-final

# run and then paste {"hello":"message"}
docker run --rm -it nix-scratch-final jq . 

# run to prove sox works
docker run --rm -it --entrypoint /bin/sox nix-distroless-final --version 
```

## Troubleshooting

If you need to troubleshoot the builds.  

```sh
# exec into container
docker run --rm -it --entrypoint /bin/sh nix-distroless                                  

# show sizes
dive nix-distroless
```

## Bonus ffmpeg

```sh
# build the packages 
docker build --no-cache --progress=plain -f Dockerfile.ffmpeg --target BUILDER -t nix-ffmpeg-builder .    
# show the dependencies that need to be copied 
#docker build --no-cache --progress=plain -f Dockerfile.distroless --target LDD -t nix-distroless .    
docker run --rm -it --entrypoint /bin/sh --name nix-ffmpeg-builder nix-ffmpeg-builder  

# build final scratch image
docker build --no-cache --progress=plain -f Dockerfile.ffmpeg --target PRODUCTION -t nix-ffmpeg-final .
```


## Resources

* Add a tips/tricks doc to the README with info on how to do common Dockerfile tasks [here](https://github.com/GoogleContainerTools/distroless/issues/13)
* Documentation for gcr.io/distroless/base and gcr.io/distroless/static [here](https://github.com/GoogleContainerTools/distroless/tree/main/base)
* [Nix-dev] Generating nixos-compatible binaries? And bootstrapped packages. [here](https://releases.nixos.org/nix-dev/2016-August/021431.html)
* On-demand linked libraries for Nix [here](https://fzakaria.com/2020/11/18/on-demand-linked-libraries-for-nix.html)
* nix-alien [here](https://github.com/thiagokokada/nix-alien)
* nix-autobahn [here](https://github.com/Lassulus/nix-autobahn)
* A files database for nixpkgs [here](https://github.com/bennofs/nix-index)
