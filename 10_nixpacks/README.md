# NIXPACKS

Demonstrate how to use NixPacks to build containers.  

NOTES:

* Nixpacks simplify using nix for installing software but they seem to create massive images.  

## Prereqs

```sh
# install nixpacks
brew install railwayapp/tap/nixpacks

# show options
nixpacks 
```

## Build

```sh
# build ffmpeg
nixpacks build . --name nixpack_example --start-cmd "ffmpeg --version"
# run 
docker run -it nixpack_example
```

## Resources

* NixPacks Introduction [here](https://nixpacks.com/docs)  
* railwayapp/nixpacks [here](https://github.com/railwayapp/nixpacks/tree/main/examples)  
