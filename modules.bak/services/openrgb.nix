{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.services.openrgb = {
    enable = lib.mkEnableOption "OpenRGB";
  };

  config =
    lib.mkIf config.nixorcism.services.openrgb.enable {
      services.hardware.openrgb = {
        enable = true;
        package = pkgs.openrgb;
      };
    };
}
