#!/bin/bash
MACHINENAME=$1

IMAGENAME=../out/iso/nixos-22.11.4426.c8a17ce7abc-x86_64-linux.isonixos.iso

# Download ubuntu.iso
if [ ! -f $IMAGENAME ]; then
    echo "Image $IMAGENAME does not exist"
    exit 1
fi

# Create VM
VBoxManage createvm --name $MACHINENAME --ostype "Debian_64" --register --basefolder $(pwd)

# Set memory and network
VBoxManage modifyvm $MACHINENAME --ioapic on
VBoxManage modifyvm $MACHINENAME --memory 1024 --vram 128
VBoxManage modifyvm $MACHINENAME --nic1 nat

# Create Disk and connect Debian Iso
VBoxManage createhd --filename $(pwd)/$MACHINENAME/${MACHINENAME}_DISK.vdi --size 80000 --format VDI
VBoxManage storagectl $MACHINENAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  $(pwd)/$MACHINENAME/${MACHINENAME}_DISK.vdi
VBoxManage storagectl $MACHINENAME --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach $MACHINENAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium $(pwd)/$IMAGENAME
VBoxManage modifyvm $MACHINENAME --boot1 dvd --boot2 disk --boot3 none --boot4 none

# Enable RDP
VBoxManage modifyvm $MACHINENAME --vrde on
VBoxManage modifyvm $MACHINENAME --vrdemulticon on --vrdeport 10001

# Start the VM
VBoxHeadless --startvm $MACHINENAME
