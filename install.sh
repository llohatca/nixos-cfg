#!/usr/bin/env bash
echo '   _  ___      ____  ____  ____         __       ____       
  / |/ (_)_ __/ __ \/ __/ /  _/__  ___ / /____ _/ / /__ ____
 /    / /\ \ / /_/ /\ \  _/ // _ \(_-</ __/ _ `/ / / -_) __/
/_/|_/_//_\_\\____/___/ /___/_//_/___/\__/\_,_/_/_/\__/_/                                                               
'

git clone https://github.com/llohatca/nixos-cfg.git || echo "Error downloading" && exit
cd ./nixos-cfg || exit

sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./hosts/HP_Pavilion_g6_Notebook_PC/disk-config.nix || echo "Error (disko)" && exit

sudo nix-env -iA nixos.nix nixos.flakes || echo "Error installing (flakes)" && exit
sudo nixos-install --flake ./flake.nix#hp || echo "Error install (hp)" && exit

sudo umount -R /mnt || echo "Error (umount)" && exit
sudo reboot || echo "Error (reboot)" && exit
