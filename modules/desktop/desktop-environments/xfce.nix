{
  flake.modules.nixos.desktop-environments'xfce = {pkgs, ...}: {
    services.xserver.desktopManager.xfce = {
      enable = true;
      enableWaylandSession = true;
      enableXfwm = false;
    };

    environment.xfce.excludePackages = with pkgs; [
      mousepad
      parole
      xfce4-taskmanager
      xfce4-terminal
    ];

    nixorcism.preserve.user = {
      directories = [
        ".config/Thunar"
        ".config/labwc"
        ".config/xfce4"
      ];

      files = [".local/share/recently-used.xbel"];
    };

    imports = [../_common.nix];
  };
}
