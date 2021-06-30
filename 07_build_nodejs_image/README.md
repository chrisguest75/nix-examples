# README
Building a Nix nodejs image

TODO:
* passwd is missing and crashes userinfo
* final image should not have bash or anymore tools than necessary. 


## Build nix image builer (buildnixnode)
```sh
# build nix
docker build -t buildnixnode -f build.nixnode.Dockerfile .

# build the image (creates a docker-image file in current path)    
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
docker build --no-cache --target prod -t nixnodeapp:latest -f app.Dockerfile .

docker run -it nixnodeapp  

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

# inside the container.
mkdir /scratch
cp /build/package.json /scratch
cp /build/package-lock.json /scratch
cp /build/index.js /scratch
cd /scratch
node index.js

# debugging the built app
docker run -v $(pwd):/build -it --entrypoint /bin/bash nixnodeapp:latest  
```





