{ osConfig, pkgs, ... }:
let
  terminal = "alacritty";
  fileManager = "nemo";
  menu = "wofi --show drun";
  # vibrance = "hyprshade on ~/.config/hyprshade/shaders/blue-light-filter.glsl";
in 
{
  # imports = [
  #   ./sessionVariables.nix
  # ];

  home.packages = with pkgs; [
    grimblast
    nwg-dock-hyprland
  ];
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    _JAVA_AWT_WM_NONREPARENTING = 1;
    GDK_BACKEND = "wayland,x11";
    SDL_VIDEODRIVER = "wayland,x11,windows";
    CLUTTER_BACKEND = "wayland";
    ELECTRON_OZONE_PLATFORM_HINT = "auto";
    DESKTOPINTEGRATION = "1";
    # MANGOHUD = "1";

    MOZ_ENABLE_WAYLAND = "1";
    MOZ_DISABLE_RDD_SANDBOX = "1";

    QT_AUTO_SCREEN_SCALE_FACTOR = "1 ";
    QT_QPA_PLATFORM = "wayland;xcb ";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1 ";
    QT_QPA_PLATFORMTHEME = "gtk3";

    XCURSOR_SIZE = "24";
    HYPRCURSOR_SIZE = "24";
  };


  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      monitor = "LVDS-1, 1366x768@59, 0x0, 1";

      exec = [
        "hyprshade on ~/.config/hyprshade/shaders/blue-light-filter.glsl"
      ];

      input = {
        kb_layout = "us,ru";
        # kb_model = "pc105+inet";
        kb_options = "grp:alt_shift_toggle";
        numlock_by_default = true;

        follow_mouse = 1;

        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };

        accel_profile = "flat";
      };

      device  = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
        accel_profile = "flat";
      };

      cursor = {
        no_hardware_cursors = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "rgba(cba6f7ee)";
        "col.inactive_border" = "rgb(61565c)";
      };

      decoration = {
        rounding = 8;

        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
        };
        #layerrule = blur,rofi
        #layerrule = ignorealpha [1],rofi
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;

        "col.shadow" = "rgba(1a1a1aee)";
        dim_inactive = false;
      };

      animations = {
        enabled = true;
        first_launch_animation = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      gestures = {
        workspace_swipe = true;
      };

      misc = {
        force_default_wallpaper = 0;
      };

      workspace = 
        [
          "1,monitor:LVDS-1, default:true"
          "2,monitor:LVDS-1"
          "3,monitor:LVDS-1"
          "4,monitor:LVDS-1"
          "5,monitor:LVDS-1"
          "6,monitor:LVDS-1"
          "7,monitor:LVDS-1"
          "8,monitor:LVDS-1"
          "9,monitor:LVDS-1"
          "0,monitor:LVDS-1"
        ];

      #  windowrulev2 = [
      #   #Fix sharing video
      #   "workspace [w], class:^(hyprland-share-picker)$, title:^(MainPicker)$"
      #   "float, class:^(hyprland-share-picker)$, title:^(MainPicker)$"
      #   "size 500 290, class:^(hyprland-share-picker)$, title:^(MainPicker)$"
      #  ];


      "$mod" = "SUPER";
      bind = [
        "$mod, R, exec, ${terminal}"
        "$mod, Q, killactive,"
        "$mod, M, exit,"
        "$mod, E, exec, ${fileManager}"
        "$mod, V, togglefloating,"
        "$mod, D, fullscreen,"
        "$mod, A, exec, ${menu}"
        "$mod, P, pseudo,"
        ", Print, exec, grimblast --notify --freeze copysave output"
        "Ctrl, Print,  exec, grimblast --notify --freeze copysave area"

        "$mod, L, movefocus, r"
        "$mod, H, movefocus, l"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"

        "$mod, S, togglespecialworkspace, magic"
        "$mod SHIFT, S, movetoworkspace, special:magic"

        "$mod SHIFT, H, swapwindow, l"
        "$mod SHIFT, L, swapwindow, r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"

        "$mod CTRL, H, resizeactive, -20 0"
        "$mod CTRL, L, resizeactive, 20 0"
        "$mod CTRL, K, resizeactive, 0 -20"
        "$mod CTRL, J, resizeactive, 0 20"


        "$mod, mouse_down, workspace, e-1"
        "$mod, mouse_up, workspace, e+1"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"

        "$mod, Control_L, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod, ALT_L, resizewindow"
      ];

    };
  };
}
