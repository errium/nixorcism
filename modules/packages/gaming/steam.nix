{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gaming.steam = {
    enable = lib.mkEnableOption "Steam";
  };

  config = lib.mkIf config.nixorcism.packages.gaming.steam.enable {
    programs.steam.enable = true;
  };
}
