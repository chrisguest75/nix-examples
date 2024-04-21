# NOTES

TODO:

* yarn test override https://nixos-and-flakes.thiscute.world/development/intro
* updating tools and garbage collecting.  
* flatpak - spotify, slack, zoom, 1password
* configure screenrc, powerlevel10K
* build python

Questions

* Installing as default software vs creating environments?

## Install 

* home-manager - install
* vscode - https://matthewrhone.dev/nixos-vscode-environment
* zsh - configuration nix and oh-my-zsh
	* https://medium.com/thelinux/how-to-configure-zsh-and-oh-my-zsh-in-nixos-6ddfbc3f0da3 
* docker - 
	* https://wiki.nixos.org/wiki/Docker
	* https://wiki.nixos.org/wiki/Visual_Studio_Code
* ssh - https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
* gnome extensions
* both unstable and stable packages - install dive from unstable

# Reconfigure

```sh
# root user has own channels
sudo -i
nix-channel --list

ls /etc/nixos

# editing in place
sudo -i 
nano /etc/nixos/configuration.nix 
nixos-rebuild switch

# building from a git repo
sudo -i
cd home/chrisguest/code/scratch/nix-examples/25_manual_nixos_install/
nixos-rebuild switch -I nixos-config=$(pwd)/configs/nixos/configuration.nix
```

## Backup

```sh
cp -r /etc/nixos ~/code/scratch/nix-examples/25_manual_nixos_install/configs/nixos
cp ~/.config/home-manager/home.nix ~/code/scratch/nix-examples/25_manual_nixos_install/

ll -a ~/code/scratch/nix-examples/25_manual_nixos_install/
```

## Gnome

Windows Key + H - hides a window  

## home manager

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

# TMUX

ctrl+b+arrow keys to switch panes

```sh
nix-shell -p git -p tmux

tmux 
```

https://borretti.me/article/nixos-for-the-impatient#postinstall

# starter configs


https://github.com/Misterio77/nix-starter-configs

```sh
docker run hello-world
```

## Node

REF: [github.com/chrisguest75/typescript_examples/34_todo_api/README.md](https://github.com/chrisguest75/typescript_examples/blob/master/34_todo_api/README.md)

```sh
# enter a shell with node.
nix-shell --run zsh -p nodejs_20 nodePackages_latest.npm just
```


# other stuff

* https://syncthing.net/
* https://github.com/Mic92/sops-nix
* https://mynixos.com/

* https://nixos.wiki/wiki/Node.js
* https://discourse.nixos.org/t/how-to-install-nvm-node-version-manager-in-nixos/20644/8

## Files


https://www.mankier.com/5/configuration.nix
https://nix-community.github.io/home-manager/#sec-install-standalone
https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix
https://ghedam.at/15490/so-tell-me-about-nix
https://nixos.wiki/wiki/Flakes


hyprland https://gitlab.com/Zaney/zaneyos
