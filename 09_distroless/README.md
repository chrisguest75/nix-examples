# README

Demonstrate using `nix` package to install into a distroless/scratch image.  

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
docker build --no-cache --progress=plain -f Dockerfile.scratch --target LDD -t nix-scratch .    
# build final scratch image
docker build --no-cache --progress=plain -f Dockerfile.scratch --target PRODUCTION -t nix-scratch-final .    
```

### Distroless

```sh
# build the packages 
docker build --no-cache --progress=plain -f Dockerfile.distroless --target BUILDER -t nix-distroless-builder .    
# show the dependencies that need to be copied 
docker build --no-cache --progress=plain -f Dockerfile.distroless --target LDD -t nix-distroless .    
# build final scratch image
docker build --no-cache --progress=plain -f Dockerfile.distroless --target PRODUCTION -t nix-distroless-final .    
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

https://github.com/GoogleContainerTools/distroless/issues/13
https://github.com/GoogleContainerTools/distroless/tree/main/base

https://releases.nixos.org/nix-dev/2016-August/021431.html
https://fzakaria.com/2020/11/17/on-demand-linked-libraries-for-nix.html


https://github.com/thiagokokada/nix-alien
https://github.com/Lassulus/nix-autobahn
https://github.com/bennofs/nix-index

