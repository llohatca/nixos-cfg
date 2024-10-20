{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePerdicate = (_: true);
  };

  programs.nh = {
    enable = true;
    flake = "/home/lulu/nixos-cfg/";
  };

  environment.systemPackages = with pkgs; [
    neovim
    vesktop
    fastfetch
    wget
    gvfs
    nemo
    nemo-fileroller
    git
    home-manager
    dconf
    clang-tools
    clang


  ];

  #Pipewire
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #Zram
  zramSwap.enable = true;
  zramSwap.priority = 32767;
  zramSwap.swapDevices = 2;

  #Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    (nerdfonts.override { fonts = [ "JetBrainsMono" "CascadiaCode" ]; })
  ];



  programs.steam = {
    enable = true;
  };

}
