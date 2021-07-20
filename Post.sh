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
pacman -S grub efibootmgr
useradd -m -g users -G wheel -s /bin/bash nikita
passwd nikita
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
