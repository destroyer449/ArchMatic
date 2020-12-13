#!/usr/bin/env bash
#-------------------------------------------------------------------------
#      _          _    __  __      _   _
#     /_\  _ _ __| |_ |  \/  |__ _| |_(_)__
#    / _ \| '_/ _| ' \| |\/| / _` |  _| / _|
#   /_/ \_\_| \__|_||_|_|  |_\__,_|\__|_\__|
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo "-------------------------------------------------"
echo "Setting up mirrors for optimal download - US Only"
echo "-------------------------------------------------"
timedatectl set-ntp true
pacman -Syyy && pacman -S --noconfirm pacman-contrib 
pacman -S pacman-contrib --noconfirm
pacman -S reflector
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector -c America -a 6 --sort rate --save /etc/pacman.d/mirrorlist

echo -e "\nInstalling prereqs...\n$HR"
pacman -S --noconfirm btrfs-progs

echo "-------------------------------------------------"
echo "-------select your disk to format----------------"
echo "-------------------------------------------------"
lsblk
echo "Please enter disk: (example /dev/sda)"
read DISK
echo "--------------------------------------"
echo -e "\nFormatting disk...\n$HR"
echo "--------------------------------------"

# make partitions
parted "${DISK}" -- mklabel gpt
parted "${DISK}" -- mkpart ESP fat32 1MiB 400MiB 
parted "${DISK}" -- set 1 esp on
parted "${DISK}" -- mkpart primary linux-swap -400MiB 4GiB
parted "${DISK}" -- mkpart primary 4GiB 100% 

# make filesystems
echo -e "\nCreating Filesystems...\n$HR"

mkfs.fat -F32 "${DISK}1"
mkfs.btrfs -L "ROOT" "${DISK}3"
mkswap "${DISK}2"
swapon "${DISK}2"

# mount target
mkdir /mnt
mount "${DISK}3" /mnt
btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@var
btrfs subvolume create /mnt/@snapshots
umount /mnt
mount -o noatime,compress=lzo,space_cache,subvol=@ "${DISK}3" /mnt
mkdir -p /mnt/{boot/EFI,home,var,.snapshots}
mount -o noatime,compress=lzo,space_cache,subvol=@home "${DISK}3" /mnt/home
mount -o noatime,compress=lzo,space_cache,subvol=@var "${DISK}3" /mnt/var
mount -o noatime,compress=lzo,space_cache,subvol=@snapshots "${DISK}3" /mnt/.snapshots
mount "${DISK}1" /mnt/boot/EFI

echo "--------------------------------------"
echo "-- Arch Install on Main Drive       --"
echo "--------------------------------------"
pacstrap /mnt base base-devel linux-zen linux-zen-headers linux-lts linux-lts-headers linux-firmware neovim snapper --noconfirm --needed
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

echo "--------------------------------------"
echo "-- Bootloader GRUB Installation  --"
echo "--------------------------------------"
pacman -S grub grub-btrfs efibootmgr os-prober mtools dosfstools
grub-install --target=x64_64-efi --bootloader-id=GRUB ${DISK}
grub-mkconfig -o /boot/grub/grub.cfg

echo "--------------------------------------"
echo "--          Network Setup           --"
echo "--------------------------------------"
pacman -S networkmanager network-manager-applet wpa_supplicant dialog --noconfirm --needed
systemctl enable --now NetworkManager

echo "--------------------------------------"
echo "--      Set Password for Root       --"
echo "--------------------------------------"
echo "Enter password for root user: "
passwd root

exit
umount -R /mnt

echo "--------------------------------------"
echo "--   SYSTEM READY FOR FIRST BOOT    --"
echo "--------------------------------------"
