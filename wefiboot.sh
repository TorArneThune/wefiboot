#!/bin/sh
confloc="/etc/wefiboot.conf"
if [ -f $confloc ]; then
  source $confloc
else
  printf "%s\n" "No config file found at this location: $confloc" >&2; exit 1
fi
if [[ $windows_efi_hex =~ ^[0-9a-fA-F]{4}$ ]]; then
  efibootmgr -n $windows_efi_hex
  systemctl reboot
else
  printf "%s\n" "Value of windows_efi_hex variable in $confloc is not a hex number" >&2; exit 1
fi
