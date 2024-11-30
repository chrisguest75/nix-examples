# Installing software

Demonstrates how to install software using nix package manager  

ℹ️ NOTE: This can be run in the [playground](../00_playground/README.md)  

* [Cheatsheet](https://nixos.wiki/wiki/Cheatsheet)  
* [Package Revisions](https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package=kubectl)  

## Contents

- [Installing software](#installing-software)
  - [Contents](#contents)
  - [🗺 Discover](#-discover)
  - [👨‍💻 Install](#-install)
  - [⚡️ Execute](#️-execute)
  - [Profiles](#profiles)
  - [📝 Channels](#-channels)
  - [Multiple Channels (unstable)](#multiple-channels-unstable)
  - [Resources](#resources)

## 🗺 Discover

Search for `jq` on package manager [search.nixos.org](https://search.nixos.org/)  

```sh
# query all the packages
nix-env -qa 

# partial matches - beginning with jq
nix-env -qa 'jq.*'
```

## 👨‍💻 Install

Install the packages  

```sh
# nixpkgs is the channel
nix-env -iA nixpkgs.jq

# how to install stable vs unstable
nix-env -iA nixpkgs.jql

# list installed packages
nix-env --query --installed

# removing a package
nix-env --uninstall jql          
```

## ⚡️ Execute

```sh
# show the paths
which jq
> /home/${USER}/.nix-profile/bin/jq

# show dependencies (you'll see dependencies all under /nix/store)
ldd $(which jq)
```

Create a shell and run a command.  

```sh
# pure shell with run command
nix-shell --pure -p jq --run "jq --version"   
```

## Profiles

```sh
# profile list
nix profile list

# install a package 
nix profile install nixpkgs#jq

# show the history of the profiles
nix profile history
```

## 📝 Channels

nix-channels [docs](https://nixos.wiki/wiki/Nix_channels)  

```sh
# default in the container is unstable.  
nix-channel --list

# add a unstable channel - this is already default in the container.
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
# you may find packages are unavailable until you update.  
nix-channel --update

# find ffmpeg 
nix-env -qa 'ffmpeg.*'

# hydra checks build status
nix-env -iA nixpkgs.hydra-check
hydra-check --channel unstable ffmpeg_6
hydra-check --channel 22.11 ffmpeg_6
hydra-check --channel unstable ffmpeg_5
hydra-check --channel 22.11 ffmpeg_5

# how to install stable vs unstable
nix-env -iA nixpkgs.ffmpeg
```

## Multiple Channels (unstable)

Install a package from the unstable channel.  

```sh
# default in the container is unstable.  
nix-channel --list

# add a unstable channel - this is already default in the container.
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs-unstable
# you may find packages are unavailable until you update.  
nix-channel --update

# install from unstable
nix-env -f '<nixpkgs-unstable>' -iA container-structure-test
container-structure-test
```

## Resources

* nix-channels [here](https://nixos.wiki/wiki/Nix_channels)  
* nix package search [here](https://search.nixos.org/)  
* Package Revisions [here](https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package=kubectl)  
* check hydra for the build status of a package in a given channel. [here](https://github.com/nix-community/hydra-check)  
* Installing only a single package from `unstable` [here](https://discourse.nixos.org/t/installing-only-a-single-package-from-unstable/5598/3)
