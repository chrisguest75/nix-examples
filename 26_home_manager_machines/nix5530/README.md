# HOME MANAGER

Demonstrate a config for a machine.  

* NixOS & Flakes Book An unofficial book for beginners [here](https://nixos-and-flakes.thiscute.world/)

TODO:

* gnome extensions are still not working
* hyprland
* atarist emulator
* vpn??

NOTES:

* The legacy 390 driver for nvidia do not install

## Configuration

Has to be run using sudo.

```sh
# root user has own channels
sudo -i
nix-channel --list

ls /etc/nixos

# building from a git repo
sudo -i
cd /home/chrisguest/code/scratch/nix-examples/26_home_manager_machines/nix5530
export NIXPKGS_ALLOW_UNFREE=1
nix-shell -p git --extra-experimental-features nix-command --extra-experimental-features flakes

nixos-rebuild switch --flake .#nix5530-nixos
```

## Home Manager

Has to be run as user.  After installed for first time use `just home`  

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

## Flatpak

```sh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak update

flatpak install org.videolan.VLC 
```

## Resources

* NixOS: Managing GNOME Keyboard Shortcuts and Settings with Home Manager [here](https://heywoodlh.io/nixos-gnome-settings-and-keyboard-shortcuts)
* How do i install the stupid proprietary nvidia drivers  [here](https://www.reddit.com/r/NixOS/comments/18n21n8/how_do_i_install_the_stupid_proprietary_nvidia/?rdt=59192)
* References to hardware.opengl.driSupport need to be removed [here](https://github.com/NixOS/nixos-hardware/issues/996#issuecomment-2183266924)
* What's a legacy driver? [here](https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/)
