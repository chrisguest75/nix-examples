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
# partial matches - beginning with jq
nix-env -qa 'jq.*'        
```

## 👨‍💻 Install

Install the package  

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

```sh
# pure shell with run command
nix-shell --pure -p jq --run "jq --version"   
```

## 📝 Channels

nix-channels [docs](https://nixos.wiki/wiki/Nix_channels)

```sh
nix-channel --list
```

## Resources

* nix-channels [here](https://nixos.wiki/wiki/Nix_channels)  
