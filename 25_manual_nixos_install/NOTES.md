# NOTES

TODO:

* install pre-commit, commitizen
* Get a typescript project compiling 
* flatpak - spotify, slack, zoom, 1password

## Questions

* default software vs creating environments?


## Install 

* home-manager - install
* vscode - https://matthewrhone.dev/nixos-vscode-environment
* zsh - configuration nix and oh-my-zsh
	* https://medium.com/thelinux/how-to-configure-zsh-and-oh-my-zsh-in-nixos-6ddfbc3f0da3 
* docker - 
	* https://wiki.nixos.org/wiki/Docker
	* https://wiki.nixos.org/wiki/Visual_Studio_Code
* gh
* ssh - https://jeppesen.io/git-commit-sign-nix-home-manager-ssh/
* gnome extensions
* both unstable and stable packages

## backup

cp -r /etc/nixos ~/code/scratch/notes
cp ~/.config/home-manager/home.nix ~/code/scratch/notes 

ll -a ~/code/scratch/notes

## files

ls /etc/nixos

https://www.mankier.com/5/configuration.nix
https://nix-community.github.io/home-manager/#sec-install-standalone
https://ghedam.at/24353/tutorial-getting-started-with-home-manager-for-nix
https://ghedam.at/15490/so-tell-me-about-nix
https://nixos.wiki/wiki/Flakes

## home manager

nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

home-manager

nano ~/.config/home-manager/home.nix

home-manager build
home-manager switch

git config --list --global

# 

nix-shell -p git -p tmux

tmux 
ctrl+b+arrow keys to switch panes

# reconfigure

sudo -i 
nano /etc/nixos/configuration.nix 
nixos-rebuild switch

https://borretti.me/article/nixos-for-the-impatient#postinstall

# starter configs
https://github.com/Misterio77/nix-starter-configs



docker run hello-world



# other stuff

https://syncthing.net/
https://github.com/Mic92/sops-nix
https://mynixos.com/


