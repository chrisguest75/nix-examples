# Installing software

Demonstrates how to install software using nix package manager  

ℹ️ NOTE: This can be run in the [playground](../00_playground/README.md)  

* [Cheatsheet](https://nixos.wiki/wiki/Cheatsheet)  
* [Package Revisions](https://lazamar.co.uk/nix-versions/?channel=nixpkgs-unstable&package=kubectl)  

## 🗺 Discover

```sh
# search for jq
https://search.nixos.org/

# query all the packages
nix-env -qa
```

## 👨‍💻 Install

Install the package  

```sh
nix-env -iA nixpkgs.jq
```

## ⚡️ Execute

```sh
# show the paths
which jq
> /home/${USER}/.nix-profile/bin/jq
```

## 📝 Channels

nix-channels [docs](https://nixos.wiki/wiki/Nix_channels)

```sh
nix-channel --list
```
