{ inputs, pkgs, ... }:
{
  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePerdicate = (_: true);
  };

  programs = {
    imv.enable = true;
    mpv.enable = true;
  };

  home.packages = with pkgs; [
    #############
    # cli tools #
    #############
    # zerotierone

    ## system control ##

    btop
    powertop
    wl-clipboard
    wl-clipboard-x11
    hyprshade
    spoofdpi
    pulseaudio

    ## system tools ##
    unzip
    unrar
    p7zip

    ## shell ##
    fzf
    zoxide
    lsd
    bat
    ripgrep

    ## tui ##
    yazi
    ueberzugpp
    lazygit

    ## fetch ##
    fastfetch


    ###########################
    # desktop envirement pkgs #
    ###########################
    alacritty
    wofi
    grimblast
    swww
    qbittorrent

    ################
    # settings app #
    ################
    pavucontrol
    dconf-editor

    ##############
    # usage pkgs #
    ##############
    firefox
    # vesktop
    inputs.ayugram-desktop.packages.${pkgs.system}.default
    nekoray
    transmission_4-gtk
    qpwgraph
    file-roller
    hyprpicker

    #############
    # dev tools #
    #############
    python312
    python312Packages.pip
    nodejs_22
  ];
}
