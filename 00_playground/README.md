# README

Playground based on building `nix` in Docker (doesn't require local Nix install)

## Tools in Nix

Nix comes with a set of tools.  

| Tool | Details |
| ---- | ------- |
| nix  | a tool for reproducible and declarative configuration management  |
| nix-env  | manipulate or query Nix user environments |
| nix-shell | start an interactive shell based on a Nix expression |
| nix-store | manipulate or query the Nix store |
| nix-build | build a Nix expression |
| nix-instantiate | instantiate store derivations from Nix expressions |
| nix-collect-garbage | delete unreachable store paths |
  
Rather than individual tools there seems to be a move towards the `nix` command that has a set of operations.  
  
| Operation | Details |
| ---- | ------- |
| nix repl | REPL environment |
| nix profile | allows you to create and manage Nix profiles |

## 🏠 Build and Run

Build the docker container environment.  

```sh
# build nix
docker build -t nix-playground .

# debugging and host repo in build folder
docker run -v $(pwd)/..:/build -it --entrypoint /bin/sh nix-playground
```

## 📋 Configure

Install manpages.  

```sh
# install man to view manpages
nix-env -iA nixpkgs.man

# show nix-env man
man nix-env
```

A Nix profile is a set of packages that can be installed and upgraded independently from each other. Nix profiles are versioned, allowing them to be rolled back easily.  

```sh
# list installed packages.
nix profile list

# find curl and remove index
nix profile remove 7
```

## 🔍 Investigate

```sh
# Installed packages
ls /nix/store/

# the path to the bins
ls -l /root/.nix-profile/bin

# location where channel packages are stored locally
cd .nix-defexpr/channels/nixpkgs/

# latest commitid
curl -L https://nixos.org/channels/nixpkgs-unstable/git-revision

# version of channel nixpkgs
nix-instantiate --eval -E '(import <nixpkgs> {}).lib.version'  | tr -d '"'
```

### nix-info

```sh
# print out some info 
nix-env -iA nixpkgs.nix-info
nix-info -m

 - system: `"x86_64-linux"`
 - host os: `Linux 5.10.76-linuxkit`
 - multi-user?: `yes`
 - sandbox: `no`
 - version: `nix-env (Nix) 2.6.1`
 - channels(root): `""`
 - nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixpkgs`
```

## 👩‍💻Shells

Add packages to the current environment.  

```sh
# to ensure latest packages you need to update
nix-channel --update

# run shell with bash
nix-env -iA nixpkgs.bash
bash

# run shell with curl (inside bash shell)
nix-env -iA nixpkgs.curl 
env
curl -I https://www.google.com
```

Open a shell with a package made available

```sh
# open a shell with hello packages
nix-shell -p hello
hello
curl

# pure does not inherit from the parent
nix-shell --pure -p hello
hello
curl

# multiple packages
nix-shell --pure -p hello -p htop
hello
htop

# to get the index link (get history in github, browse code and copy link to zip download)
nix-shell --pure -p sox -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/8e36f0c4d18a55630954ff2206b1c05ec3fb8bb5.tar.gz
sox --version
```

## Cleanup

```sh
# delete unreachable store paths
nix-collect-garbage
```

## Goto 01_simple_python

You can use the shell in the container to run some of the other examples without installing Nix locally
Steps [README.md](./01_simple_python/README.md)  

## Resources

* Ad hoc developer environments [here](https://nixos.org/guides/ad-hoc-developer-environments.html)  
* Towards reproducibility: pinning Nixpkgs [here](https://nix.dev/tutorials/towards-reproducibility-pinning-nixpkgs.html)  
* NixOS/nixpkgs/tags [here](https://github.com/NixOS/nixpkgs/tags)  
* holidaycheck/nix-venient repo [here](https://github.com/holidaycheck/nix-venient)  
