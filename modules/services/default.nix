{
  flake.modules.nixos.gvfs = {
    services.gvfs.enable = true;
  };

  flake.modules.nixos.openrgb = {
    services.hardware.openrgb.enable = true;
  };

  flake.modules.nixos.openssh = {
    services.openssh.enable = true;
  };
}
