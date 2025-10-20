{
  config,
  lib,
  ...
}: {
  options.nixDots.packages.gaming = {
    steam.enable = lib.mkEnableOption "Enables steam";
  };

  config = lib.mkIf config.nixDots.packages.gaming.steam.enable {
    programs.steam.enable = true;
  };
}
