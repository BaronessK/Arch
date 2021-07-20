mkfs.fat -F32 /dev/sda1 & mkfs.btrfs -f /dev/sda2
mount /dev/sda2 /mnt
btrfs subvolume create /mnt/@root 
btrfs subvolume create /mnt/@home 
umount /mnt
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@root /dev/sda2 /mnt 
mkdir /mnt/home 
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@home /dev/sda2 /mnt/home
mkdir /boot/efi 
mount /dev/sda1 /boot/efi
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com  
pacman-key --lsign-key 3056513887B78AEB
pacman-key --lsign-key 3056513887B78AEB
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
