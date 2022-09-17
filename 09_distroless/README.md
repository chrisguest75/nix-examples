# README

Demonstrate using `nix` package to install into a distroless/scratch image.  

NOTES:

* This produces images with applications containing only the binaries required to run them.  

TODO:  

* creates too many layers for dive.
* squash it
* --ouput doesn't seem to work on macosx
* nixos image is 500MB

## Build

Build images

### Scratch

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

### Distroless

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

```sh
# run to prove jq works
docker run --rm -it nix-scratch-final

# run to prove sox works
docker run --rm -it --entrypoint /bin/sox nix-distroless-final --version 
```

## Troubleshooting

```sh
# exec into container
docker run --rm -it --entrypoint /bin/sh nix-distroless                                  

# show sizes
dive nix-distroless
```

## Resources

* Add a tips/tricks doc to the README with info on how to do common Dockerfile tasks [here](https://github.com/GoogleContainerTools/distroless/issues/13)
* Documentation for gcr.io/distroless/base and gcr.io/distroless/static [here](https://github.com/GoogleContainerTools/distroless/tree/main/base)
* [Nix-dev] Generating nixos-compatible binaries? And bootstrapped packages. [here](https://releases.nixos.org/nix-dev/2016-August/021431.html)
* On-demand linked libraries for Nix [here](https://fzakaria.com/2020/11/18/on-demand-linked-libraries-for-nix.html)
* nix-alien [here](https://github.com/thiagokokada/nix-alien)
* nix-autobahn [here](https://github.com/Lassulus/nix-autobahn)
* A files database for nixpkgs [here](https://github.com/bennofs/nix-index)
