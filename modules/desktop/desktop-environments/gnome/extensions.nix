{
  flake.modules.nixos.desktop-environment_gnome = {pkgs, ...}: {
    hm.programs.gnome-shell = {
      enable = true;

      extensions = with pkgs.gnomeExtensions; [
        {package = appindicator;}
        {package = fuzzy-app-search;}
        {package = space-bar;}
        {package = tactile;}
        {package = tasks-in-panel;}
      ];
    };
  };
}
