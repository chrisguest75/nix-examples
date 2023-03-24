# README

[![Repository](https://skillicons.dev/icons?i=docker,bash,linux)](https://skillicons.dev)

Demonstrate some examples of Nix in `docker`.  

ℹ️ NOTE: Use [playground](##Example-0---Nix-playground) to test if you'd prefer not to install Nix.  

A list of things still to try and investigate [TODO.md](./TODO.md)  

## Nix

Nix is a powerful and flexible package manager for Unix-based systems, such as Linux and macOS. It was created to address some of the limitations and problems associated with traditional package managers like apt, yum, and pacman. Nix provides a reliable and reproducible way of managing software packages and their dependencies.  

Some key features of Nix include:

* Declarative package management: Users can describe the desired software environment in a declarative language called Nix expressions. This allows for easy sharing, reproducibility, and version control of software environments.

* Isolation of package dependencies: Nix stores packages in isolation from each other, which prevents dependency conflicts and simplifies the process of upgrading, rolling back, or removing packages.

* Atomic upgrades and rollbacks: Nix supports atomic operations, meaning that upgrading or rolling back a package does not affect the rest of the system. If an upgrade fails or a package causes issues, you can easily revert to the previous version without any consequences.

* Multi-user support: Nix allows multiple users on a single system to have their own software environments without interfering with one another. This is particularly useful in shared or managed environments like research labs, universities, or workplaces.

* Source and binary packages: Nix can build packages from source code or use precompiled binaries. This allows for greater flexibility and choice in how software is installed and managed.

* NixOS: Nix is also the basis for NixOS, a Linux distribution built entirely around the Nix package manager. NixOS takes the principles of Nix and applies them to the entire operating system, resulting in a highly customizable, reproducible, and maintainable system.

Overall, Nix is a powerful package management solution that aims to make managing software on Unix-based systems more reliable, flexible, and reproducible.

## Glossary

The is a glossary file [here](./GLOSSARY.md) with a few terms used from Nix.  

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

## 15 - Determinate System Installer

Demonstrate how to use the Determinate Systems Installer.  
Steps [README.md](./15_determinate_install/README.md)  

## 17 - custom package

Demonstrate how to build a custom package.  
Steps [README.md](./17_custom_package/README.md)  

## 20 - script dependencies

Demonstrate how to write scripts that pack their dependencies.  
Steps [README.md](./20_script_dependencies/README.md)  

## 22 - shells

Demonstrate how to write scripts that pack their dependencies.  
Steps [README.md](./20_script_dependencies/README.md)  


## 👀 Resources

* Search more than 80 000 packages [here](https://search.nixos.org/)
* [Minimal Docker Images](https://jpetazzo.github.io/2020/04/01/quest-minimal-docker-images-part-3/)  
* [Nix-by-example](https://medium.com/@MrJamesFisher/nix-by-example-a0063a1a4c55)  
* Nix Flakes: an Introduction [here](https://christine.website/blog/nix-flakes-1-2022-02-21)
* Building a Nix Package [here](https://elatov.github.io/2022/01/building-a-nix-package/)
* How to Learn Nix [here](https://ianthehenry.com/posts/how-to-learn-nix/)
* How to Learn Nix, Part 1: What's all this about? [here](https://ianthehenry.com/posts/how-to-learn-nix/introduction/)
* awesome-nix [here](https://nix-community.github.io/awesome-nix/)
* Nix Book [here](https://github.com/NixOS/nix-book)  
* What Is Nix [here](https://shopify.engineering/what-is-nix)  
* Nix.dev [here](https://nix.dev/)  
