# HOME MANAGER


## Configuration 

```sh
# root user has own channels
sudo -i
nix-channel --list

ls /etc/nixos

# building from a git repo
sudo -i
cd home/chrisguest/code/scratch/nix-examples/26_home_manager/
nixos-rebuild switch --flake .#w520-nixos
```

```sh
```

## Home Manager

https://home-manager-options.extranix.com/

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

home-manager

nano ~/.config/home-manager/home.nix

cp ./configs/home.nix ~/.config/home-manager/home.nix
cat ~/.config/home-manager/home.nix

home-manager build
home-manager switch

# verify the config is applied
git config --list --global
cat ~/.config/tmux/tmux.conf
```

## Resources

* Nix Starter Config [here](https://github.com/Misterio77/nix-starter-configs)