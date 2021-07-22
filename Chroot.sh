echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen 
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc --utc
echo Nikita > /etc/hostname
echo "127.0.1.1 localhost.localdomain Nikita" > /etc/hosts
passwd & useradd -m -g users -G wheel,video -s /bin/bash nikita
sh -c "sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers"
passwd nikita
pacman -Suy iwd wpa_supplicant dhclient pipewire nano git budgie-desktop lightdm
git clone https://github.com/aircrack-ng/rtl8188eus.git
bootctl install & echo "default Arch" > /boot/loader/loader.conf 
echo -e "title BlackArch \n linux /vmlinuz-linux \n initrd /initramfs-linux.img \n options root=/dev/nvme0n1p6 rw
exit
umount -R /mnt/boot & umount -R /mnt

