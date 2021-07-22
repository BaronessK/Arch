pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com  
pacman-key --lsign-key 3056513887B78AEB
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' 
echo -e "[options] \nHoldPkg = pacman glibc \nArchitecture = auto \nCheckSpace \nParallelDownloads = 3 \nSigLevel = Required DatabaseOptional \nLocalFileSigLevel = Optional \n[core] \n Include = /etc/pacman.d/mirrorlist \n[extra] \n Include = /etc/pacman.d/mirrorlist \n[community] \n Include = /etc/pacman.d/mirrorlist \n[multilib] \nInclude = /etc/pacman.d/mirrorlist \n[chaotic-aur] \nInclude = /etc/pacman.d/chaotic-mirrorlist" > /etc/pacman.conf
sudo pacman -Suy linux-tkg-bmq-generic_v3 linux-tkg-bmq-generic_v3-headers git nano pipewire-pulse
