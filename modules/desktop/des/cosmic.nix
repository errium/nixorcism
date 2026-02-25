{
  flake.modules.nixos.de_cosmic = {pkgs, ...}: {
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
