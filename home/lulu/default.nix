{ config, pkgs, ... }: {
  home = {
    username = "lulu";
    homeDirectory = "/home/lulu";
    # DONT TOUCH
    stateVersion = "24.05";
  };

  imports = [
    ./modules
    ./configs
    ./packages.nix
  ];
}
