# HOME MANAGER

Demonstrate a config for a machine.  

- NixOS & Flakes Book An unofficial book for beginners [here](https://nixos-and-flakes.thiscute.world/)

REF: Add software from unstable example [04_installing_software/README.md](../04_installing_software/README.md)  

## Prepping

You've installed a new machine. Now what?

```sh
mkdir ./Code/scratch
NIXPKGS_ALLOW_UNFREE=1 nix-shell -p just git gh vscode

gh repo clone nix-examples

mkdir -p ./26_home_manager_machines/bigmonga/nixos
cp -r /etc/nixos ./26_home_manager_machines/bigmonga/
```

## Machines

- [bigmonga](./bigmonga/README.md)
- [nix5530](./nix5530/README.md)
- [w520-nixos](./w520-nixos/README.md)

## Resources

- Introduction to Home Manager [here](https://nix-community.github.io/home-manager/index.xhtml#ch-introduction)
- NixOS Configuration [here](https://sanatanhalder.com/blog/nixos-configuration/)
- Home Manager [here](https://nixos.wiki/wiki/Home_Manager)
