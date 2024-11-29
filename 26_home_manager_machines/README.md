# HOME MANAGER

Demonstrate a config for a machine.  

* NixOS & Flakes Book An unofficial book for beginners [here](https://nixos-and-flakes.thiscute.world/)

## Configuration

```sh
# root user has own channels
sudo -i
nix-channel --list

ls /etc/nixos

# building from a git repo
sudo -i
cd /home/chrisguest/code/scratch/nix-examples/26_home_manager_machines/nix5530
export NIXPKGS_ALLOW_UNFREE=1
nix-shell -p git -p gh -p vscode
nixos-rebuild switch --flake .#nix5530-nixos
```

## Home Manager

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

home-manager

home-manager switch --flake .#chrisguest@nix5530-nixos

# verify the config is applied
git config --list --global
cat ~/.config/tmux/tmux.conf
```

## TMUX

ctrl+b+arrow keys to switch panes

```sh
nix-shell -p git -p tmux

tmux 
```
