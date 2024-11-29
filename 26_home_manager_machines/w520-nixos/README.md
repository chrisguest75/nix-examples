# HOME MANAGER

Demonstrate a config for a machine.  

* NixOS & Flakes Book An unofficial book for beginners [here](https://nixos-and-flakes.thiscute.world/)
https://github.com/Misterio77/nix-starter-configs

TODO:

* yarn test override https://nixos-and-flakes.thiscute.world/development/intro
* updating tools and garbage collecting.  
* flatpak - spotify, slack, zoom, 1password
* configure screenrc, powerlevel10K
* gnome extensions

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

## Home Manager

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

home-manager

nano ~/.config/home-manager/home.nix

cp ./configs/home.nix ~/.config/home-manager/home.nix
cat ~/.config/home-manager/home.nix

home-manager switch --flake .#chrisguest@w520-nixos

# verify the config is applied
git config --list --global
cat ~/.config/tmux/tmux.conf
```

# TMUX

ctrl+b+arrow keys to switch panes

```sh
nix-shell -p git -p tmux

tmux 
```

## Node

REF: [github.com/chrisguest75/typescript_examples/34_todo_api/README.md](https://github.com/chrisguest75/typescript_examples/blob/master/34_todo_api/README.md)

```sh
# enter a shell with node.
nix-shell --run zsh -p nodejs_20 nodePackages_latest.npm just
```

## Python

* Build Python example [here](https://github.com/chrisguest75/python_examples/tree/main/22_nix)
 
## Resources

* https://home-manager-options.extranix.com/
* Nix Starter Config [here](https://github.com/Misterio77/nix-starter-configs)
* vscode - https://matthewrhone.dev/nixos-vscode-environment
* zsh - configuration nix and oh-my-zsh
	* https://medium.com/thelinux/how-to-configure-zsh-and-oh-my-zsh-in-nixos-6ddfbc3f0da3 
* docker - 
	* https://wiki.nixos.org/wiki/Docker
	* https://wiki.nixos.org/wiki/Visual_Studio_Code
