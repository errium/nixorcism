{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.nixorcism.desktop.display-manager == "gdm") {
    services.displayManager.gdm = {
      enable = true;
    };
  };
}
