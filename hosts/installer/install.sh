#!/usr/bin/env bash
# heavily inspired by https://github.com/LilleAila/dotfiles/blob/d729f1af37454b3ecfe7e18088ba6b5c663b214a/hosts/installer/install.sh
set -e

repo_url="git@github.com:IldenH/dotfiles.git"
default_user="ildenhnix"

function yesno() {
  local prompt="$1"

  while true; do
    read -rp "$prompt [y/n] " yn
    case $yn in
      [Yy]* ) echo "y"; return;;
      [Nn]* ) echo "n"; return;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

function info() {
  # 35 is magenta
  echo -e "\e[1;35m$1\e[0m"
}

while true; do
  info "Checking internet connection..."
  if ping -c 1 "8.8.8.8" &> /dev/null; then
    info "Internet connection is up."
    break
  else
    nmtui
  fi
done

cat << Introduction

This script will format the *entire* disk with a 1GB boot partition
(labelled NIXBOOT), 16GB of swap, then allocating the rest to ZFS.

The following ZFS datasets will be created:
    - zroot/root (mounted at / with blank snapshot)
    - zroot/nix (mounted at /nix)
    - zroot/tmp (mounted at /tmp)
    - zroot/persist (mounted at /persist)
    - zroot/persist/cache (mounted at /persist/cache)

Introduction

while true; do
  info "Available disks:"
  lsblk -do NAME,SIZE,TYPE,MODEL
  read -p "The NAME of the disk to format: " DISKINPUT
  DISK="/dev/${DISKINPUT}"
  if [ -b "$DISK" ]; then
    info "Selected disk: $DISKINPUT"
    break
  else
    info "Invalid disk name $DISKINPUT"
  fi
done
if [[ $DISKINPUT == nvme* ]]; then
  BOOTDISK="${DISK}p3"
  SWAPDISK="${DISK}p2"
  ZFSDISK="${DISK}p1"
else
  BOOTDISK="${DISK}3"
  SWAPDISK="${DISK}2"
  ZFSDISK="${DISK}1"
fi

info "Boot Partiton: $BOOTDISK"
info "SWAP Partiton: $SWAPDISK"
info "ZFS Partiton: $ZFSDISK"

use_encryption=$(yesno "Use encryption?")

read -rp "Username of the main user ($default_user): " username 
if [ -z "$username" ]; then
  username="$default_user"
fi

info "Importing GPG key"
gpg --import /etc/installer/gpg-key.asc
info "Cloning configuration"
git clone "$repo_url" dotfiles
cd dotfiles
info "Decrypting secrets"
git-crypt unlock

info "Choose which host to install"
HOST_LIST=$(nix flake show . --json 2>/dev/null | jq --raw-output '.nixosConfigurations | keys[] | select(test("installer") | not)')
HOST=$(echo -e "Configure a new host\n${HOST_LIST}" | fzf --header="Choose a host to install")
echo

if [ "$HOST" == "Configure a new host" ]; then
  info "Configuring new host..."
  read -rp "Name for the new host: " HOST_NAME
  cp -r hosts/template "hosts/$HOST_NAME"
  sudo nixos-generate-config --no-filesystems --show-hardware-config > "hosts/$HOST_NAME/hardware-configuration.nix"

  info "Editing configuration.nix"
  config="hosts/$HOST_NAME/configuration.nix"
  if [[ $use_encryption == "y" ]]; then
    sed -i "/zfs.encryption/s/false/true/" $config
  fi
  hostId="$(head -c 8 /etc/machine-id)"
  sed -i "/networking.hostId/s/placeholder/$hostId/" $config
  nvim $config

  info "Adding configuration to flake.nix"
  sed -i "/installer = lib.nixosSystem {/i \ \ \ \ \ \ $HOST_NAME = mkHost \"$HOST_NAME\" [];" flake.nix
  git add -A
else
  HOST_NAME=$HOST
fi

echo
info "Is everything correct?"
cat << config

Disk: $DISK 
Encryption: $use_encryption
User: $username
Host: $HOST_NAME

config

do_format=$(yesno "This irreversibly formats the entire disk. Are you sure?")
if [[ $do_format == "n" ]]; then
    exit
fi

info "Starting installer... come back once done in a little bit!"

info "Partitioning disk"
sudo blkdiscard -f "$DISK"

sudo sgdisk -n3:1M:+1G -t3:EF00 "$DISK"
sudo sgdisk -n2:0:+16G -t2:8200 "$DISK"
sudo sgdisk -n1:0:0 -t1:BF01 "$DISK"

# notify kernel of partition changes
sudo sgdisk -p "$DISK" > /dev/null
sleep 5

info "Creating Swap"
sudo mkswap "$SWAPDISK" --label "SWAP"
sudo swapon "$SWAPDISK"

info "Creating Boot Disk"
sudo mkfs.fat -F 32 "$BOOTDISK" -n NIXBOOT

# setup encryption
if [[ $use_encryption == "y" ]]; then
    encryption_options=(-O encryption=aes-256-gcm -O keyformat=passphrase -O keylocation=prompt)
else
    encryption_options=()
fi

info "Creating base zpool"
sudo zpool create -f \
    -o ashift=12 \
    -o autotrim=on \
    -O compression=zstd \
    -O acltype=posixacl \
    -O atime=off \
    -O xattr=sa \
    -O normalization=formD \
    -O mountpoint=none \
    "${encryption_options[@]}" \
    zroot "$ZFSDISK"

info "Creating /"
sudo zfs create -o mountpoint=legacy zroot/root
sudo zfs snapshot zroot/root@blank
sudo mount -t zfs zroot/root /mnt

info "Mounting /boot (efi)"
sudo mount --mkdir "$BOOTDISK" /mnt/boot

info "Creating /nix"
sudo zfs create -o mountpoint=legacy zroot/nix
sudo mount --mkdir -t zfs zroot/nix /mnt/nix

info "Creating /tmp"
sudo zfs create -o mountpoint=legacy zroot/tmp
sudo mount --mkdir -t zfs zroot/tmp /mnt/tmp

info "Creating /cache"
sudo zfs create -o mountpoint=legacy zroot/cache
sudo mount --mkdir -t zfs zroot/cache /mnt/cache

info "Creating /persist"
sudo zfs create -o mountpoint=legacy zroot/persist
sudo mount --mkdir -t zfs zroot/persist /mnt/persist

info "Installing NixOS configuration for host $HOST_NAME"
sudo nixos-install --no-root-password --flake .#$HOST_NAME --impure

info "Copying secrets"
sudo mkdir -p "/mnt/cache/home/$username"
sudo cp secrets/gpg-key.asc "/mnt/cache/home/$username/"
sudo chown -R $username "/mnt/cache/home/$username"
sudo mkdir -p "/mnt/persist/home/$username"
sudo chown -R $username "/mnt/persist/home/$username"

info "Done!"
cat << Summary

Remember to import the gpg key after reboot!
`gpg --import gpg-key.asc`

Summary

if [ "$HOST" == "Configure a new host" ]; then
  info "Also modify the generated config and commit (hosts: added $HOST_NAME) before rebooting!"
fi
