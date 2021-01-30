# README
Playground based on building nix in docker

```sh
# build nix
docker build -t nix-playground .
# debugging
docker run -v $(pwd):/build -it --entrypoint /bin/sh nix-playground    
```
