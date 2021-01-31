# README
Playground based on building nix in docker

```sh
# build nix
docker build -t nix-playground .
# debugging
docker run -v $(pwd):/build -it --entrypoint /bin/sh nix-playground    
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

```sh
# run shell with bash
nix run nixpkgs.bash
# run shell with curl
nix run nixpkgs.curl 
env
```