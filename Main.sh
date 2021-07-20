pacstrap /mnt base base-devel intel-ucode iucode-tool linux-tkg-muqss-generic_v3 linux-tkg-muqss-generic_v3-headers git
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
