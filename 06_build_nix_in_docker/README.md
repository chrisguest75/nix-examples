# README
Building a Nix image inside a container


## Build nix image builer 
```sh
# build nix
docker build -t nix .

# build the image (creates a docker-image file in current path)    
docker run -v $(pwd):/build -it nix     
```

## Load image into registry
```sh
# load image into local registry
docker load < docker-image

# should be most recent image
docker images
```

## Inside build container
```sh
# jump into bash in container
docker run -it bash:latest

# use curl inside the container
curl https://www.google.com

# ignore tls certs
curl -k https://www.google.com
```

## Vulnerability scanning
```sh
# zero vulnerabilities for bash
docker scan bash:latest 
```

## Troubleshooting
```sh
# debugging
docker run -v $(pwd):/build -it --entrypoint /bin/sh nix    
nix-build --show-trace
```






