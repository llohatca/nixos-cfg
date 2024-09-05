{ config, lib,  pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./packages.nix
  ];

  networking.hostName = "hp";
  networking.networkmanager.enable = true;

  users.users.lulu = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" "plugdev" "dialout" ];
  };

    #DONT TOUCH !
  system.stateVersion = "23.11";
}

