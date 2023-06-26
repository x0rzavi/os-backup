#!/bin/env dash

/usr/bin/sbsign --key /root/secure_boot/MOK/MOK.key --cert /root/secure_boot/MOK/MOK.crt --output /efi/EFI/zbm/grubx64.efi /efi/EFI/zbm/grubx64.efi
