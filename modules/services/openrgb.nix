{
  flake.modules.nixos.service_openrgb = {pkgs, ...}: {
    services.hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb;
    };
  };
}
