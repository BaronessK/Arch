sudo umount /dev/sda2
mkfs.fat -F32 /dev/sda1
mkfs.btrfs -f /dev/sda2
mount /dev/sda2 /mnt
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@home
umount /mnt
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@root /dev/sda2 /mnt
mkdir /mnt/home
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@home /dev/sda2 /mnt/home
mkdir /boot/efi
mount /dev/sda1 /mnt/boot/efi

