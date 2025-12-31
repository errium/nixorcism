{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.desktop.desktop-environments = {
    cosmic.enable = lib.mkEnableOption "Enables cosmic";
  };

  config = lib.mkIf config.nixorcism.desktop.desktop-environments.cosmic.enable {
    services.desktopManager.cosmic = {
      enable = true;
      showExcludedPkgsWarning = false;
    };

    environment.cosmic.excludePackages = with pkgs; [
      cosmic-player
    ];
  };
}
