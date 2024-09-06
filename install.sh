#!/usr/bin/env bash

# git clone https://github.com/llohatca/nixos-cfg.git && echo "Downloading" || echo "Error Downloading (git)"; exit
# cd ./nixos-cfg && echo "cd (ok)" || echo "Error (cd)"; exit

# sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/HP_Pavilion_g6_Notebook_PC/disk-config.nix && echo "ok (disko)" || echo "Error (disko)"; exit

# tut nado udalenie
# i eshe nada rezmetka diska


install_nixos() {
  sudo nix-collect-garbage -d

  sudo mkfs.fat -F 32 /dev/sda1 && echo "ok (fat 32)" || echo "Error (fat 32)"; exit
  sudo mkfs.ext4 /dev/sda2 && echo "ok (ext4)" || echo "Error (ext4)"; exit
  sudo mount /dev/sda2 /mnt && echo "ok (mount /mnt)" || echo "Error (mount /mnt)"; exit
  sudo mkdir /mnt/boot && echo "ok (mkdir /mnt/boot)" || echo "Error (mkdir /mnt/boot)"; exit
  sudo mount /dev/sda1 /mnt/boot && echo "ok (mount /mnt/boot)" || echo "Error (mount /mnt/boot)"; exit

  sudo nixos-install --flake ./flake.nix#hp && echo "Installing (hp)" || echo "Error installing (hp)"; exit
  sudo umount -R /mnt && echo "ok (umount)" || echo "Error (umount)"; exit
  sudo reboot && echo "ok (reboot)" || echo "Error (reboot)"; exit
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

