# README
Building a Nix nodejs image

## Overview
We create three images:
* `buildnixnode` - used to build nixnode image (the baseimage builder)
* `nixnode` - used to build the imae containing nodejs and npm
* `nixnodeapp` - the final image with the application in it

## Build nix image builer (buildnixnode)
```sh
# build nix
docker build -t buildnixnode -f build.nixnode.Dockerfile .

# build the image (creates a docker-image file in current path)  
# if altering the default.nix rerun this 
docker run -v $(pwd):/build -it buildnixnode     
```

## Load image into registry
```sh
# load image into local registry (builds nixnode)
docker load < docker-image

# should be most recent image
docker images
```

## Inside build container
```sh
# jump into bash in container
docker run -it --entrypoint /bin/bash nixnode:latest 

# check node version
node --version
```

## Build node app (nixnodeapp uses nixnode:latest)
```sh
# build the app image
docker build --no-cache --target prod -t nixnodeapp:latest -f app.Dockerfile .

# run the appimage
docker run -it nixnodeapp:latest  

# look inside the app image
dive nixnodeapp:latest 
```

## Vulnerability scanning
```sh
# zero vulnerabilities for bash
docker scan nixnodeapp:latest 
```

## Troubleshooting 
### Builder
```sh
# debugging
docker run -v $(pwd):/build -it --entrypoint /bin/sh buildnixnode  
nix-build --show-trace
```

### App
```sh
# debugging building app
docker run -v $(pwd):/build -it --entrypoint /bin/bash nixnode:latest  

# inside the container - copy the app files.
mkdir /scratch
cp /build/package.json /scratch
cp /build/package-lock.json /scratch
cp /build/index.js /scratch
cd /scratch
node index.js

# debugging the built app
docker run -v $(pwd):/build -it --entrypoint /bin/bash nixnodeapp:latest  

# inspect the image
dive nixnodeapp:latest  
```



# Resourcesa
* docker-nixpkgs [here](https://github.com/nix-community/docker-nixpkgs)
* Good example nix buildImage [here](https://github.com/nix-community/docker-nixpkgs/blob/master/images/devcontainer/default.nix)  
