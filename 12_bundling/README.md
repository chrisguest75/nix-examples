# BUNDLE

Demonstrate how to use `nix bundles`.  

NOTES:

* Bundling creates a single file from a package and it's dependencies  
* The docker bundling creates a crazy amount of layers.  
* The images are not optimised in any kind of way.  

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-bundle .
# debugging and host repo in build folder
docker run -v $(pwd):/work -it --entrypoint /root/.nix-profile/bin/bash nix-bundle
```

## Install packages

```bash
nix-build multitool.nix
```

## Bundle

### Single file

Generae single files.  

```sh
nix bundle --help

# it packages but requires hexdump to run
nix bundle nixpkgs#hello
nix bundle nixpkgs#sox

nix-env -iA nixpkgs.hexdump nixpkgs.bzip2 nixpkgs.gnused

# THIS DOES NOT SEEM TO WORK IN A CONTAINER
cp ./sox-unstable ./sox-unstable2
./sox-unstable2
```

### Docker

Generate docker images.  

```sh
# HELLO
# in container
nix bundle --bundler github:NixOS/bundlers#toDockerImage nixpkgs#hello
cp ./hello-2.12.1.tar.gz ./hello 
# on host
docker load < ./hello
dive hello-2.12.1:latest
docker run -it --entrypoint /bin/hello hello-2.12.1:latest

# in container
nix bundle --bundler github:NixOS/bundlers#toDockerImage nixpkgs#sox
cp sox-unstable-2021-05-09.tar.gz sox
# on host
docker load < ./sox
dive sox-unstable-2021-05-09:latest
docker run -it --entrypoint /bin/sox sox-unstable-2021-05-09:latest

# in container
nix bundle --bundler github:NixOS/bundlers#toDockerImage nixpkgs#ffmpeg_5
cp ffmpeg-5.1.3.tar.gz ffmpeg
# on host
docker load < ./ffmpeg
docker run -it --entrypoint /bin/ffmpeg ffmpeg-5.1.3:latest
```

### Report

Generate a report.  

```sh
nix bundle --bundler github:NixOS/bundlers#toReport nixpkgs#sox
cp sox-unstable-2021-05-09-report report 
```

## Resources

* NixOS/bundlers repo [here](https://github.com/NixOS/bundlers)  
* matthewbauer/nix-bundle repo [here](https://github.com/matthewbauer/nix-bundle)  
* Shows all of the bundlers available [here](https://github.com/NixOS/bundlers/blob/master/flake.nix)  
* Arx repo [here](https://github.com/solidsnack/arx)  