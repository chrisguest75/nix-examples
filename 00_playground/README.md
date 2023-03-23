# README

Playground based on building `nix` in Docker (doesn't require local Nix install)

## Tools in Nix

* nix
* nix-env
* nix-shell
* nix-store - manipulate or query the Nix store
* nix-build - build a Nix expression
* nix-instantiate

## 🏠 Build and Run

```sh
# build nix
docker build -t nix-playground .
# debugging and host repo in build folder
docker run -v $(pwd)/..:/build -it --entrypoint /bin/sh nix-playground    

# or just this directory
docker run -v $(pwd)/.:/build -it --entrypoint /bin/sh nix-playground

```

## 📋 Configure

```sh
# install man to view manpages
nix-env -iA nixpkgs.man
# show nix-env man
man nix-env
```

## 🔍 Investigate

```sh
# Installed packages
ls /nix/store/

# the path to the bins
ls -l /root/.nix-profile/bin
```

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

```sh
# run shell with bash
nix-env -iA nixpkgs.bash
bash
# run shell with curl (inside bash shell)
nix-env -iA nixpkgs.curl 
env
curl -I https://www.google.com
```

```sh
# open a shell with hello packages
nix-shell -p hello
hello
curl

# pure does not inherit from the parent
nix-shell --pure -p hello
hello
curl

# to get the index link (get history in github, browse code and copy link to zip download)
nix-shell --pure -p sox -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/8e36f0c4d18a55630954ff2206b1c05ec3fb8bb5.tar.gz
sox --version
```

## Cleanup

```sh
nix-collect-garbage
```

## Follow steps in 01_simple_python

You can use the shell in the container to run some of the other examples without installing Nix locally
Steps [README.md](./01_simple_python/README.md)  

## Resources

* Ad hoc developer environments [here](https://nixos.org/guides/ad-hoc-developer-environments.html)  
* Towards reproducibility: pinning Nixpkgs [here](https://nix.dev/tutorials/towards-reproducibility-pinning-nixpkgs.html)  
