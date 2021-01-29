# README
Building a Nix image inside a container

```sh
docker run -v $(pwd):/mnt -it --entrypoint /bin/sh nixos/nix     

cd /mnt 
nix-build
```


