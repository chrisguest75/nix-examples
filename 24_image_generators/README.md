# GENERATORS

Demonstrate generators for generating nixos images   

## Install

Use the deteminate systems installer [here](../15_determinate_install/README.md)  

```sh
# install
nix profile install github:nix-community/nixos-generators

nixos-generate --list 


nixos-generate -f iso

/nix/store/h1ap4xr9mvj3q9rx8slbf6zwjazf9q93-nixos.iso/iso/nixos.iso

nixos-generate -f virtualbox

/nix/store/5qf5m38758s4sgi8j5790f2bhv1z76i9-nixos-ova-23.05pre-git-x86_64-linux/nixos-23.05pre-git-x86_64-linux.ova


# this works in virtual box
nixos-generate -f install-iso

/nix/store/klfsa8bwd3165j6s3s1gw86xx6s1yq9w-nixos-23.05pre-git-x86_64-linux.isonixos.iso/iso/nixos-23.05pre-git-x86_64-linux.isonixos.iso


nix-shell --command './nixos-generate -f iso -I nixpkgs=channel:nixos-22.11'

```




## Resources

* https://channels.nixos.org/
* https://github.com/nix-community/nixos-generators

