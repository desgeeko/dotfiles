#!/usr/bin/env bash


# TO INSTALL BEFORE RUNNING THIS SCRIPT:
#sudo ubuntu-drivers install nvidia:595
#or
#sudo apt install nvidia-driver-595-open


if [[ -z "${1:-}" ]]; then
    echo "Usage: $0 <VM_NAME>" >&2
    exit 1
fi

vm_name="$1"

# input ids: 
#ls -l  /dev/input/by-id/| grep -E 'event-kbd|event-mouse'
#
# hostdev ids:
#lspci -nnk | grep NVIDIA


virt-xml "$vm_name" --add-device --hostdev 01:00.0
virt-xml "$vm_name" --add-device --hostdev 01:00.1

virt-xml "$vm_name" --add-device --input type=evdev,source.dev=/dev/input/by-id/usb-CHERRY_CHERRY_USB_KEYBOARD-event-kbd,source.grab=all,source.grabToggle=scrolllock,source.repeat=on
virt-xml "$vm_name" --add-device --input type=evdev,source.dev=/dev/input/by-id/usb-CHERRY_CHERRY_USB_KEYBOARD-if01-event-kbd
virt-xml "$vm_name" --add-device --input type=evdev,source.dev=/dev/input/by-id/usb-Logitech_USB_Optical_Mouse-event-mouse





