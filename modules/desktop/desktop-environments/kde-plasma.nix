{
  flake.modules.nixos.kdePlasma = {pkgs, ...}: {
    services.desktopManager.plasma6 = {
      enable = true;
      enableQt5Integration = true;
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      ark
      baloo-widgets
      dolphin
      dolphin-plugins
      elisa
      ffmpegthumbs
      gwenview
      kate
      khelpcenter
      konsole
      krdp
      ktexteditor
      kwin-x11
      okular
      plasma-browser-integration
      plasma-keyboard
      qtvirtualkeyboard
    ];
  };
}
