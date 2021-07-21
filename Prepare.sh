mkfs.fat -F32 /dev/sda1 & mkfs.btrfs -f /dev/sda2 & mkfs.btrfs -f /dev/sda3
mount -o compress=zstd,noatime,space_cache=v2,ssd /dev/sda2 /mnt
umount /mnt & mkdir /mnt/home
mount-o compress=zstd,noatime,space_cache=v2,ssd /dev/sda3 /mnt/home
umount /mnt/home & mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com  
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

pacstrap /mnt base base-devel linux-firmware linux-xanmod linux-xanmod-headers
genfstab -U /mnt >> /mnt/etc/fstab
arch-root /mnt -c /Chroot.sh
