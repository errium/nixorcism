{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./affinity.nix
    ./alacritty.nix
    ./foot.nix
    ./librewolf.nix
    ./spicetify.nix
    ./vesktop.nix
  ];

  options.nixorcism.packages.gui = {
    pkgArray.enable = lib.mkEnableOption "Enables array";
  };

  config = lib.mkIf config.nixorcism.packages.gui.pkgArray.enable {
    hm.home.packages = with pkgs; [
      bitwarden-desktop
      feishin
      file-roller
      nautilus
      obs-studio
      protonvpn-gui
      telegram-desktop
    ];
  };
}
