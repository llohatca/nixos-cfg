{ pkgs, ... }: {

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePerdicate = (_: true);
  };

  environment.systemPackages = with pkgs; [
    neovim
    fastfetch
    wget
    wl-clipboard
    wl-clipboard-x11
    wofi
    btop
    firefox
    vesktop
    alacritty
    pavucontrol
    ripgrep
    gvfs
    nemo
    p7zip
    nemo-fileroller
    git
    qbittorrent
    xdg-desktop-portal-gtk

    gcc
    llvmPackages.clang
    llvmPackages.clang-tools
    python312
    python312Packages.pip
    nodejs_22
    cargo
    rustc


    # Re:Nvim #
    lua-language-server
    rust-analyzer
    bash-language-server
    marksman
    hyprls

    stylua
    nixpkgs-fmt
  ];

  #Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

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
