# Single Package Docker Image

Demonstrates how to build a single package docker image in Nix

[Nix Docker Docs](https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-dockerTools)

## Local

Follow if you have installed Nix locally

```sh
nix-build
docker load < result

# take the loaded image name and use when you run
docker images
docker run -t hello-docker:am0g0d04g0jszzxqmycbag4mjd5k8yfr
```

## Playground

Follow if you are in the playground

```sh
# in playground
nix-build
# copy link to volume mounted path on host
cp ./result ./myimage
```

Once image is built then import it on the host  

```sh
# open another local terminal on the host
docker load < myimage

# take the loaded image name and use when you run
docker images
docker run -t hello-docker:am0g0d04g0jszzxqmycbag4mjd5k8yfr
```
