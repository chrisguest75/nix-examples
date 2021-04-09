# README
Playground based on building nix in Docker (doesn't require local Nix install)

## Build and Run
```sh
# build nix
docker build -t nix-playground .
# debugging and host repo in build folder
docker run -v $(pwd)/..:/build -it --entrypoint /bin/sh nix-playground    
```

## Configure
```sh
# install man to view manpages
nix-env -iA nixpkgs.man
# show nix-env man
man nix-env
```

## Investigate
```sh
# Installed packages
ls /nix/store/

# the path to the bins
ls -l /root/.nix-profile/bin
```

```sh
# print out some info 
nix run nixpkgs.nix-info -c nix-info -m

 - system: `"x86_64-linux"`
 - host os: `Linux 5.4.0-62-generic, Alpine Linux, noversion`
 - multi-user?: `yes`
 - sandbox: `no`
 - version: `nix-env (Nix) 2.3.10`
 - channels(root): `"nixpkgs-21.03pre260194.ea3638a3fb2"`
 - nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixpkgs`
```
## Shells 
```sh
# run shell with bash
nix run nixpkgs.bash
# run shell with curl (inside bash shell)
nix run nixpkgs.curl 
env
curl -I https://www.google.com
```

## Follow steps in 01_simple_python
You can use the shell in the container to run some of the other examples without installing Nix locally
Steps [README.md](./01_simple_python/README.md)  