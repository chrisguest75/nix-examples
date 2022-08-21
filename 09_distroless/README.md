# README

Demonstrate using `nix` package to install into a distroless/scratch image.  

TODO:  

* creates too many layers for dive.
* squash it 
* --ouput doesn't seem to work on linux
* nixos image is 500MB

## Build

```sh
# build the packages 
docker build -f Dockerfile --target BUILDER -t nix-distroless .    
# show the dependencies that need to be copied 
docker build --no-cache --progress=plain -f Dockerfile --target LDD -t nix-distroless .    
# build final scratch image
docker build -f Dockerfile --target PRODUCTION -t nix-distroless .    
```

## Run

```sh
# run to prove jq works
docker run --rm -it nix-distroless         
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

