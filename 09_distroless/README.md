# README

Demonstrate using `nix` package to install into a distroless image.  

TODO:  

* creates too many layers for dive.
* squash it 
* --ouput doesn't seem to work on linux
* nixos image is 500MB


```sh
docker build -f Dockerfile -t nix-distroless .    

dive nix-distroless
```

## Resources

https://github.com/GoogleContainerTools/distroless/issues/13