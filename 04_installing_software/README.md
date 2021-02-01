# Installing software
Demonstrates how to install software using nix package manager

NOTE: This can be run in the [playground](../00_playground/README.md)

## Discover
```sh
# search for jq
https://search.nixos.org/

# query all the packages
nix-env -qa
```

## Install
Install the package
```sh
nix-env -iA nixpkgs.jq
```

## Execute
```sh
# show the paths
which jq
> /home/${USER}/.nix-profile/bin/jq

```

## Channels
[Docs](https://nixos.wiki/wiki/Nix_channels)

```sh
nix-channel --list
```




