{
  config,
  lib,
  ...
}: {
  options.nixorcism.misc.flatpak = {
    enable = lib.mkEnableOption "Flatpak";
  };

  config = lib.mkIf config.nixorcism.misc.flatpak.enable {
    services.flatpak.enable = true;
  };
}
