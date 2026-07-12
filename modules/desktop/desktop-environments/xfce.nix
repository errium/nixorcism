{
  flake.modules.nixos.desktop-environment'xfce = {pkgs, ...}: {
    services.xserver = {
      enable = true; # Legacy strikes again, yikes :/
      desktopManager.xfce.enable = true;
    };

    environment.xfce.excludePackages = with pkgs; [
      mousepad
      parole
    ];

    nixorcism.preserve.user.directories = [
      ".config/xfce4"
      ".config/Thunar"
      ".local/share/recently-used.xbel"
    ];

    imports = [../_common.nix];
  };
}
