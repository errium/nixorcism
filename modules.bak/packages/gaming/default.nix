{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./steam.nix
  ];

  options.nixorcism.packages.gaming = {
    pkgArray.enable = lib.mkEnableOption "Enables array";
  };

  config = lib.mkIf config.nixorcism.packages.gaming.pkgArray.enable {
    hm.home.packages = with pkgs; [
      heroic
      mindustry
      osu-lazer-bin
    ];
  };
}
