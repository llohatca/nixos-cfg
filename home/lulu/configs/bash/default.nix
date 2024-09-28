{
  programs.bash = {
    enable = true;
      shellAliases = {
        nv       = "nvim";
        nf       = "fastfetch";
        ls       = "ls -a";
        his      = "history";
        shadeon  = "hyprshade on ~/.config/hyprshade/shaders/blue-light-filter.glsl";
        shadeoff = "hyprshade off";
      };
  };
}
