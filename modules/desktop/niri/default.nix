{
  config,
  lib,
  ...
}: {
  options.nixDots.desktop = {
    niri.enable = lib.mkEnableOption "Enables niri";
  };

  config = lib.mkIf config.nixDots.desktop.niri.enable {
    hm = {};
  };
}
