{
  config,
  lib,
  ...
}: {
  options.nixorcism.services.openrgb = {
    enable = lib.mkEnableOption "OpenRGB";
  };

  config =
    lib.mkIf config.nixorcism.services.openrgb.enable {
    };
}
