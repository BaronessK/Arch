mkfs.fat -F32 /dev/sda1 
mkfs.btrfs -f /dev/sda2 
mount /dev/sda2 /mnt
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@home
umount /mnt
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@root /dev/sda2 /mnt
mkdir /mnt/{boot,home}
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@home /dev/sda2 /mnt/home
mount /dev/sda1 /mnt/boot
pacstrap /mnt base base-devel linux-firmware linux linux-headers git nano
genfstab -U /mnt >> /mnt/etc/fstab
chroot /mnt /bin/bash
