{
  flake.modules.nixos.desktop-environments'xfce = {
    services.xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
    };

    nixorcism.preserve.user = {
      directories = [".config/Thunar" ".config/xfce4"];
      files = [".local/share/recently-used.xbel"];
    };

    imports = [../_common.nix];
  };
}
