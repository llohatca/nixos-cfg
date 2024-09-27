#!/usr/bin/env bash

# git clone https://github.com/llohatca/nixos-cfg.git && echo "Downloading" || echo "Error Downloading (git)"; exit
# cd ./nixos-cfg && echo "cd (ok)" || echo "Error (cd)"; exit

# sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/HP_Pavilion_g6_Notebook_PC/disk-config.nix && echo "ok (disko)" || echo "Error (disko)"; exit

# tut nado udalenie
# i eshe nada rezmetka diska


install_nixos() {
  # sudo nix-collect-garbage -d

  # sudo mkfs.ext4 /dev/sda2


  # sudo mkfs.fat -F 32 /dev/sda1
  # sudo mount /dev/sda2 /mnt
  # sudo mkdir /mnt/boot
  # sudo mount /dev/sda1 /mnt/boot

  # sudo nixos-install --flake ./flake.nix#hp
  # sudo umount -R /mnt
}
  echo '   _  ___      ____  ____  ____         __       ____       
  / |/ (_)_ __/ __ \/ __/ /  _/__  ___ / /____ _/ / /__ ____
 /    / /\ \ / /_/ /\ \  _/ // _ \(_-</ __/ _ `/ / / -_) __/
/_/|_/_//_\_\\____/___/ /___/_//_/___/\__/\_,_/_/_/\__/_/                                                               
'

read -p "Do you want install nixos? (Y) (n)" choice
if [[ $choice != "Y" ]]; then 
  echo "closed"; exit
else
  install_nixos
fi

