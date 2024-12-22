# HOME MANAGER

Demonstrate a config for a machine.  

* NixOS & Flakes Book An unofficial book for beginners [here](https://nixos-and-flakes.thiscute.world/)

TODO:

* hyprland
* vpn??
* Add instructions on upgrading packages like vscode
* Add instructions on how to upgrade os.
* Switch to nvidia GPU for firefox, chromium and vlc.

NOTES:

* The legacy 390 drivers for nvidia do not install.
* To test GPU use [chrisguest75/docker_examples/blob/master/A2_gpu/README.md](https://github.com/chrisguest75/docker_examples/blob/master/A2_gpu/README.md)  

## Use just

```sh
# home.nix
cd 26_home_manager_machines/nix5530/
just home 

# configuration.nix
sudo -i 
cd 26_home_manager_machines/nix5530/
just config
```

## Configuration.nix

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

`ctrl+b+arrow` keys to switch panes

```sh
nix-shell -p git -p tmux

tmux 
```

## Flatpak

Install flatpak for getting software not available as a package or a working version.  

```sh
# add flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak update

# vlc
flatpak install org.videolan.VLC 
flatpak run org.videolan.VLC 

# imhex
flatpak search ImHex   
flatpak install net.werwolv.ImHex   
```

## Resources

* NixOS: Managing GNOME Keyboard Shortcuts and Settings with Home Manager [here](https://heywoodlh.io/nixos-gnome-settings-and-keyboard-shortcuts)
* How do i install the stupid proprietary nvidia drivers  [here](https://www.reddit.com/r/NixOS/comments/18n21n8/how_do_i_install_the_stupid_proprietary_nvidia/?rdt=59192)
* References to hardware.opengl.driSupport need to be removed [here](https://github.com/NixOS/nixos-hardware/issues/996#issuecomment-2183266924)
* What's a legacy driver? [here](https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/)
* How to Install and Manage GNOME Shell Extension [here](https://www.baeldung.com/linux/gnome-shell-extension)
* Installing the NVIDIA Container Toolkit [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
* nvidia container toolkit does not work on Docker but works in Podman [here](https://github.com/NixOS/nixpkgs/issues/337873)