# Installing software
Demonstrates how to install software using nix package manager

```sh
# search for jq
https://search.nixos.org/

# 
nix-env -qa
```

Install the package
```sh
nix-env -iA nixpkgs.jq
```

```sh
# show the paths
which jq
> /home/${USER}/.nix-profile/bin/jq

```

