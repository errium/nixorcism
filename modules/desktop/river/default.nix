{
  config,
  lib,
  ...
}: {
  options.nixDots.desktop = {
    river.enable = lib.mkEnableOption "Enables river";
  };

  config = lib.mkIf config.nixDots.desktop.river.enable {
    programs.river-classic.enable = true;
    hm = {};
  };
}
