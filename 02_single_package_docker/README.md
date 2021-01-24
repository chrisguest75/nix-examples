# Single Package Docker Image
Demonstrates how to build a single package docker image in Nix

[Nix Docker Docs](https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-dockerTools)


```sh
nix-build
docker load < result
docker images
docker run -t hello-docker:am0g0d04g0jszzxqmycbag4mjd5k8yfr
```