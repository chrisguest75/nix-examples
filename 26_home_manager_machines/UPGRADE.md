# UPGRADE

Upgrading NixOS

TODO:

* Upgrading vscode does not work. `NIXPKGS_ALLOW_UNFREE=1 nix-shell -p vscode --command code`

## Configure

### Channels

```sh
# list channels (I'm using flakes so this doesn't really matter)
nix-channel --list
sudo nix-channel --list

#home-manager https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz
#nixos https://nixos.org/channels/nixos-24.05
#nixpkgs-unstable https://nixos.org/channels/nixpkgs-unstable

# updating those channels
nix-channel --update
sudo nix-channel --update
```

### Rebuild OS

```sh
cd 26_home_manager_machines/nix5530
# modify flake.nix with new version
# then update lock
nix flake update  

# check build 
nixos-rebuild build --flake .#nix5530-nixos


sudo nixos-rebuild boot --flake .#nix5530-nixos

# saves a restore point?
sudo nixos-rebuild switch --flake .#nix5530-nixos

# tidy up space
nix-collect-garbage
```

## Profiles

NOTE: I had an issue where vscode was pointing to the wrong version because the .nix-profile symlink was incorrect. It was fxed by removing vscode from profile and readding using home-manager.  

```sh
nix profile list

nix profile remove vscode
```

## Resources

* https://discourse.nixos.org/t/recommended-upgrade-path-from-23-11-to-24-05/45763
* https://medium.com/thelinux/how-to-upgrade-the-nixos-23-05-to-nixos-23-10-affa8631c6cf 
* https://medium.com/thelinux/how-to-update-home-manager-in-nixos-ffb2efbc6e94 
* https://discourse.nixos.org/t/need-help-in-updating-nixos-using-flakes/43321
 