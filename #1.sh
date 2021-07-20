mkfs.fat -F32 /dev/sda1 & mkfs.btrfs -f /dev/sda2
mount /dev/sda2 /mnt
btrfs subvolume create /mnt/@root 
btrfs subvolume create /mnt/@home 
umount /mnt
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@root /dev/sda2 /mnt 
mkdir /mnt/home 
mount -o compress=zstd,noatime,space_cache=v2,ssd,subvol=@home /dev/sda2 /mnt/home
pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com  
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo -e "[options] \n HoldPkg = pacman glibc \n Architecture = auto \n CheckSpace \n ParallelDownloads = 3 \n SigLevel = Required DatabaseOptional \n LocalFileSigLevel = Optional \n [core] \n Include = /etc/pacman.d/mirrorlist \n [extra] \n Include = /etc/pacman.d/mirrorlist \n [community] \n Include = /etc/pacman.d/mirrorlist \n [chaotic-aur] \n Include = /etc/pacman.d/chaotic-mirrorlist \n [multilib] \n Include = /etc/pacman.d/mirrorlist" > /etc/pacman.conf
pacstrap /mnt base base-devel intel-ucode iucode-tool linux-tkg-muqss-generic_v3 linux-tkg-muqss-generic_v3-headers git pipewire pipewire-pulse pipewire-alsa nano
genfstab -U /mnt >> /mnt/etc/fstab
