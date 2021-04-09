# Multi Package Docker Image
Demonstrates how to build a multi package docker image in Nix

The pkg for pkg.dockerTools.

NOTE: 
* curl does not work because of the bundle.crt
* locate bundle.crt
## Examples of how to build Docker images
[Examples](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/examples.nix)  

[Interface](https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/default.nix)

## Local
Follow if you have installed Nix locally
```sh
nix-build
docker load < result
# copy link to volume mounted path on host
docker images
docker run -t kuttl:bh3mi99nk7f1vfisv9200c0b2dwbdblx
docker run -it --entrypoint /bin/bash kuttl:bh3mi99nk7f1vfisv9200c0b2dwbdblx

# there is no ls cmd so we use echo.
echo *
echo /bin/*
echo $PATH

# you have to set the SSL_CERT_FILE variable to get certs
export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
curl -I https://www.google.com
```

## Playground
Follow if you are in the playground
```sh
# in playground
nix-build
# copy link to volume mounted path on host
cp ./result ./myimage

# open another local terminal on the host
docker load < myimage
# take the loaded image name and use when you run
docker images
docker run -t kuttl:latest    
docker run -it --entrypoint /bin/bash kuttl:latest    

# there is no ls cmd so we use echo.
echo *
echo /bin/*
echo $PATH

# you have to set the SSL_CERT_FILE variable to get certs
export SSL_CERT_FILE=/etc/ssl/certs/ca-bundle.crt
curl -I https://www.google.com

```