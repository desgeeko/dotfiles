#!/usr/bin/env bash


#VM_NAME="ubu-test"
ISO="/var/lib/libvirt/iso/ubuntu-26.04.1-desktop-amd64.iso"
MEMORY="8192"
VCPUS="2"
DISK_SIZE="40"

if [[ -z "${1:-}" ]]; then
    echo "Usage: $0 <VM_NAME>" >&2
    exit 1
fi

vm_name="$1"

if virt-install --osinfo list 2>/dev/null | grep -Eiq 'ubuntu26.04'; then
    OSINFO="ubuntu26.04"
else
    OSINFO="ubuntu25.10"
fi    

# input ids: 
#ls -l  /dev/input/by-id/| grep -E 'event-kbd|event-mouse'
#
# hostdev ids:
#lspci -nnk | grep NVIDIA

virt-install \
    --name "$vm_name" \
    --memory "$MEMORY" \
    --vcpus "$VCPUS" \
    --cpu host-passthrough \
    --disk size="$DISK_SIZE",format=qcow2,bus=virtio \
    --network network=default \
    --osinfo "$OSINFO" \
    --graphics spice \
    --video virtio \
    --boot uefi \
    --cdrom "$ISO" \
    --machine q35
#    --boot firmware=efi,firmware.feature0.name=secure-boot,firmware.feature0.enabled=no,firmware.feature1.name=enrolled-keys,firmware.feature1.enabled=no
#    --input type=evdev,source.dev=/dev/input/by-id/usb-CHERRY_CHERRY_USB_KEYBOARD-event-kbd,source.grab=all,source.grabToggle=scrolllock,source.repeat=on \
#    --input type=evdev,source.dev=/dev/input/by-id/usb-CHERRY_CHERRY_USB_KEYBOARD-if01-event-kbd \
#    --input type=evdev,source.dev=/dev/input/by-id/usb-Logitech_USB_Optical_Mouse-event-mouse
#    --hostdev pci_0000_01_00_0 \
#    --hostdev pci_0000_01_00_1




