pacstrap /mnt base base-devel btrfs-progs efibootmgr intel-ucode iucode-tool linux-tkg-muqss-generic_v3 linux-tkg-muqss-generic_v3-headers
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=ru_RU.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc --utc
date
echo Nikita > /etc/hostname 
echo "127.0.1.1 localhost.localdomain Nikita" > /etc/hosts
pacman -S networkmanager
systemctl enable NetworkManager 
passwd
123
123
pacman -S grub efibootmgr
useradd -m -g users -G wheel -s /bin/bash nikita
passwd nikita
123
123
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
