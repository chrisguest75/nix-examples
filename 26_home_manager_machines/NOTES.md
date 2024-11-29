# THINGS

## TODO




* [ ] Install git
* [ ] Install Code
* [ ] Invert Mouse



GPU drivers?  p2000
hyprland
atarist emulator
vpn??

## DONE


```sh



https://nix-community.github.io/home-manager/index.xhtml#ch-introduction

nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install

https://sanatanhalder.com/blog/nixos-configuration/


https://nixos.wiki/wiki/Home_Manager
```

## Steps

* Switch to acpi
* Installed gnome with disk encryption
* ```nix-shell -p git```
* Use firefox
* export NIXPKGS_ALLOW_UNFREE=1
* nix-env -iA nixos.vscode

nix-shell -p git -p gh -p vscode
