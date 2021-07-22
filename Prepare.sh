mkfs.fat -F32 /dev/nvme0n1p5 
mkfs.btrfs -f /dev/nvme0n1p6 
mount /dev/nvme0n1p6 /mnt
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@home
umount /mnt
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@root /dev/nvme0n1p6 /mnt
mkdir /mnt/{boot,home}
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@home /dev/nvme0n1p6 /mnt/home
mount /dev/sda1 /mnt/boot
pacstrap /mnt base base-devel linux-firmware linux linux-headers git nano
genfstab -U /mnt >> /mnt/etc/fstab
chroot /mnt /bin/bash
