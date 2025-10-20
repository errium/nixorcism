{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./steam.nix
  ];

  options.nixDots.packages.gaming = {
    pkgArray.enable = lib.mkEnableOption "Enables array";
  };

  config = lib.mkIf config.nixDots.packages.gaming.pkgArray.enable {
    hm.home.packages = with pkgs; [
      mindustry
    ];
  };
}
