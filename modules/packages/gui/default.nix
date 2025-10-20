{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./alacritty.nix
    ./librewolf.nix
  ];

  options.nixDots.packages.gui = {
    pkgArray.enable = lib.mkEnableOption "Enables array";
  };

  config = lib.mkIf config.nixDots.packages.gui.pkgArray.enable {
    hm.home.packages = with pkgs; [
      telegram-desktop
      nemo
      protonvpn-gui
      file-roller
    ];
  };
}
