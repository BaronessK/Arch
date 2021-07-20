echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && echo "ru_RU.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc --utc
date
echo Nikita > /etc/hostname 
echo "127.0.1.1 localhost.localdomain Nikita" > /etc/hosts
pacman -Suy networkmanager haveged dbus-broker grub efibootmgr plasma-nm yakuake dolphin ark gwenview ssdm plasma-dekstop
systemctl enable NetworkManager & systemctl enable haveged & systemctl enable dbus-broker & systemctl enable sddm
passwd
useradd -m -g users -G wheel -s /bin/bash nikita
sh -c "sed -i 's/^# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers"
passwd nikita
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com  
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e "[options] \n HoldPkg = pacman glibc \n Architecture = auto \n CheckSpace \n ParallelDownloads = 3 \n SigLevel = Required DatabaseOptional \n LocalFileSigLevel = Optional \n [core] \n Include = /etc/pacman.d/mirrorlist \n [extra] \n Include = /etc/pacman.d/mirrorlist \n [community] \n Include = /etc/pacman.d/mirrorlist \n [chaotic-aur] \n Include = /etc/pacman.d/chaotic-mirrorlist \n [multilib] \n Include = /etc/pacman.d/mirrorlist" > /etc/pacman.conf
mkdir /boot/efi 
mount /dev/nvme0n1p5 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi --removable
grub-mkconfig -o /boot/grub/grub.cfg
exit
umount -R /mnt

