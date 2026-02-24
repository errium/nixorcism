{
  flake.modules.nixos.de_xfce = {
    services.xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
    };
  };
}
