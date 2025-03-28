# UPGRADE

Upgrading NixOS

```sh
nix-channel --list
sudo nix-channel --list

#home-manager https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz
#nixos https://nixos.org/channels/nixos-24.05
#nixpkgs-unstable https://nixos.org/channels/nixpkgs-unstable

nix-channel --update
sudo nix-channel --update


cd 26_home_manager_machines/nix5530
# modify flake.nix with new version
# then update lock
nix flake update  

# check build 
nixos-rebuild build --flake .#nix5530-nixos


sudo nixos-rebuild boot --flake .#nix5530-nixos
```




## Resources

* https://discourse.nixos.org/t/recommended-upgrade-path-from-23-11-to-24-05/45763
* https://medium.com/thelinux/how-to-upgrade-the-nixos-23-05-to-nixos-23-10-affa8631c6cf 
* https://medium.com/thelinux/how-to-update-home-manager-in-nixos-ffb2efbc6e94 
* https://discourse.nixos.org/t/need-help-in-updating-nixos-using-flakes/43321
 