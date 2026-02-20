{
  flake.modules.nixos.xfce = {
    services.xserver = {
      enable = true;
      desktopManager.xfce.enable = true;
    };
  };
}
