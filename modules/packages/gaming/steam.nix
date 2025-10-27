{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gaming = {
    steam.enable = lib.mkEnableOption "Enables steam";
  };

  config = lib.mkIf config.nixorcism.packages.gaming.steam.enable {
    programs.steam.enable = true;
  };
}
