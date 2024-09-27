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
    hashedPassword = "$6$o0qg..L6EMGo.l2k$4PFVHl.mumawQ9wMJc1Z4in2EgRh3oEDZ8cXqxnXAqNHkKWe4eWt.119L/fHMIQKO4slPBCd97A2zY9zurMRZ1";
    extraGroups = [ "wheel" "input" "networkmanager" "plugdev" "dialout" "video" ];
  };

    #DONT TOUCH !
  system.stateVersion = "23.11";
}

