{pkgs, ...}: {
  flake.modules.nixos.service_openrgb = {
    services.hardware.openrgb = {
      enable = true;
      package = pkgs.openrgb;
    };
  };
}
