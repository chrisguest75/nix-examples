# README
Building a Nix image inside a container

```sh
# build nix
docker build -t nix .
# build the image     
docker run -v $(pwd):/build -it nix     

# debugging
docker run -v $(pwd):/build -it --entrypoint /bin/sh nix    
```

```sh
# load image
docker load < docker-image
docker images
docker run -it bash:latest
```

