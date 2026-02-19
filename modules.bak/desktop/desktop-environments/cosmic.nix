{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.desktop.desktop-environments.cosmic = {
    enable = lib.mkEnableOption "COSMIC";
  };

  config = lib.mkIf config.nixorcism.desktop.desktop-environments.cosmic.enable {
    services.desktopManager.cosmic = {
      enable = true;
      showExcludedPkgsWarning = false;
    };

    environment.cosmic.excludePackages = with pkgs; [
      alsa-utils
      cosmic-edit
      cosmic-initial-setup
      cosmic-player
      cosmic-reader
      cosmic-store
      cosmic-term
      cosmic-wallpapers
      pulseaudio
      xdg-user-dirs
    ];
  };
}
