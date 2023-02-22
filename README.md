# README

[![Repository](https://skillicons.dev/icons?i=docker,bash,linux)](https://skillicons.dev)

Demonstrate some examples of Nix in `docker`.  

ℹ️ NOTE: Use [playground](##Example-0---Nix-playground) to test if you'd prefer not to install Nix.  

📝 TODO:

* Build a custom nix package https://nixos.org/guides/nix-pills/index.html
* Understand the Nix language and API
* Understand if vulnerability detectors are just not seeing the issues.  What is vulnix?
* These are some good examples - https://github.com/foggyubiquity/containizen  
* Nix flakes https://nixos.wiki/wiki/Flakes.  Replacing nix-channels.
* https://github.com/cachix/devenv
* Add example of using a repo with a nix flake in it.  https://github.com/the-nix-way/nix-flake-dev-environments/blob/main/node/README.md

## 🏠 Install Nix

* [Install-Nix](https://nixos.org/download.html) guide
* Install vscode extension

```sh
code --install-extension bbenoist.Nix
```

Check the installation:  

```sh
# check the daemon is running
systemctl status nix-daemon

systemctl start nix-daemon      

# show help
nix-env --help
# a quick test of nix-shell
nix-shell -p nix-info --run "nix-info -m"
```

## Index and Locate files

```sh
nix-env -iA nixpkgs.nix-index
nix-shell -p nix-index

# NOTE: THis seems to fail inside a container.  
nix-index  

# Try to find ldd inside packages
nix-locate ldd
```

The [NixPkgs](https://github.com/nixos/nixpkgs) index.  

## 00 - Nix playground

Playground based on building nix in Docker (doesn't require local Nix install)  
Steps [README.md](./00_playground/README.md)  

## 01 - Simple Nix

Demonstrates how to build a python app in Nix  
Steps [README.md](./01_simple_python/README.md)  

## 02 - Single Package Docker Image

Demonstrates how to build a single package docker image in Nix  
Steps [README.md](./02_single_package_docker/README.md)  

## 03 - Multi Package Docker Image

Demonstrates how to build a multi package docker image in Nix  
Steps [README.md](./03_multi_package_docker/README.md)  

## 04 - Installing Software

Demonstrates how to install software using nix package manager  
Steps [README.md](./04_instaling_software/README.md)  

## 06 - Build Nix docker image in docker

Building a Nix image inside a container  
Steps [README.md](./06_build_nix_in_docker/README.md)  

## 07 - Build Nix `nodejs` image in docker

Building a Nix nodejs image.  
Steps [README.md](./07_build_nodejs_image/README.md)  

## 08 - Build `ffmpeg` issue

Demonstrate creating an `ffmpeg` image with Nix.  
Steps [README.md](./08_ffmpeg/README.md)  

## 09 - Build `distroless` images

Demonstrate using `nix` package to install into a distroless/scratch image.  
Steps [README.md](./09_distroless/README.md)  

## 10 - Nixpacks

Demonstrate how to use NixPacks to build containers.  
Steps [README.md](./10_nixpacks/README.md)  

## 11 - Flakes

Demonstrate how to use `nix flakes`.  
Steps [README.md](./11_flakes/README.md)  

## 14 - Distroless Flakes

Demonstrate how to use flakes to control versions of software used to build images.  
Steps [README.md](./14_distroless_flakes/README.md)  


## 👀 Resources

* Search more than 80 000 packages [here](https://search.nixos.org/)
* [Minimal Docker Images](https://jpetazzo.github.io/2020/04/01/quest-minimal-docker-images-part-3/)  
* [Nix-by-example](https://medium.com/@MrJamesFisher/nix-by-example-a0063a1a4c55)  
* Nix Flakes: an Introduction [here](https://christine.website/blog/nix-flakes-1-2022-02-21)
* Building a Nix Package [here](https://elatov.github.io/2022/01/building-a-nix-package/)
* How to Learn Nix [here](https://ianthehenry.com/posts/how-to-learn-nix/)
* How to Learn Nix, Part 1: What's all this about? [here](https://ianthehenry.com/posts/how-to-learn-nix/introduction/)
* awesome-nix [here](https://nix-community.github.io/awesome-nix/)

https://github.com/NixOS/nix-book
