# GENERATORS

Demonstrate generators for generating nixos images.  

The nixos-generators project allows to take the same NixOS configuration, and generate outputs for different target formats.  

NOTES:

* The generators generate outputs under `/nix/store`


TODO:

* Raspbian - https://nixos.wiki/wiki/NixOS_on_ARM/Raspberry_Pi_4
* Vagrant basebox - https://nixos.wiki/wiki/Vagrant

## Install

Use the deteminate systems installer [here](../15_determinate_install/README.md)  

```sh
# install the generators package
nix profile install github:nix-community/nixos-generators

# should show the path to the default configuration.nix
nix-generate --help
```

Example `configuration.nix`  

```nix
{ config, lib, pkgs, ... }:
{
  services.sshd.enable = true;
  services.nginx.enable = true;

  networking.firewall.allowedTCPPorts = [ 80 ];
  
  users.users.root.password = "nixos";
  services.openssh.permitRootLogin = lib.mkDefault "yes";
  services.getty.autologinUser = lib.mkDefault "root";
}
```

## Generate

```sh
# list the output types
nixos-generate --list 

# clean up 
rm -rf ./out

# generate a symlink of the built iso
nixos-generate -f iso -o ./out

# generate ova
nixos-generate -f virtualbox -o ./out

# this works in virtual box
nixos-generate -f install-iso -I nixpkgs=channel:nixos-22.11 -o ./out

```

## Resources

* nix-channels [here](https://channels.nixos.org/)  
* nix-community/nixos-generators repo [here](https://github.com/nix-community/nixos-generators)  
