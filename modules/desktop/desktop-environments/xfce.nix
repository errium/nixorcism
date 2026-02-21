{
  flake.modules.nixos.desktop_environment-xfce = {
    services.xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
    };
  };
}
