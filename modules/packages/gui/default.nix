{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
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
      file-roller
      nautilus
      protonvpn-gui
      telegram-desktop
    ];
  };
}
