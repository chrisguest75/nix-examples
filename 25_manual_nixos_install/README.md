# MANUAL NIXOS INSTALL

Demonstrate installing nixos from an ISO.  

## Contents

- [MANUAL NIXOS INSTALL](#manual-nixos-install)
  - [Contents](#contents)
  - [Install](#install)
  - [Laptop](#laptop)
  - [Hyper-V](#hyper-v)
    - [Configuring](#configuring)
  - [Gnome](#gnome)
  - [Resources](#resources)

## Install

REF: Downloads [here](https://nixos.org/download#nixos-more)  

```sh
curl -o ./out/latest-nixos-gnome-x86_64-linux.iso https://channels.nixos.org/nixos-23.11/latest-nixos-gnome-x86_64-linux.iso
```

## Laptop

Use [Etcher](https://etcher.balena.io/) to burn the ISO to a USB device.  

## Hyper-V 

Create a machine.  

NOTE: When trying to install the GUI version of Nix it seems HyperV struggles to boot the mahine after intallation.  

```powershell
cd .\25_manual_nixos_install
$isopath=(get-item ".\\out\\nixos-gnome-23.11.5213.b94a96839afc-x86_64-linux.iso").FullName
$isopath=(get-item ".\\out\\nixos-minimal-23.11.5213.b94a96839afc-x86_64-linux.iso").FullName
get-item $isopath 
$vmname="newnix"

# create vm
New-VM -Name "$vmname" -Generation 1 -MemoryStartupBytes 2GB -NewVHDSizeBytes 40GB -BootDevice CD -NewVHDPath (".\out\" + $vmname + ".vhdx")
# attach iso
Set-VMDvdDrive -VMName "$vmname" -Path $isopath 
# attach network
Get-VMNetworkAdapter -VMName "$vmname" | Connect-VMNetworkAdapter -SwitchName "Default Switch"

Start-Vm "${vmname}"

Remove-Vm "${vmname}"
```

### Configuring

```sh
setfont ter-v32n
```

## Gnome

Windows Key + H - hides a window  

## Resources

* https://nixos.org/manual/nixos/stable/#sec-installation
* https://github.com/NixOS/nixpkgs/issues/55332
