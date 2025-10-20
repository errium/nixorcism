{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./btop.nix
    ./git.nix
    ./helix.nix
    ./fastfetch.nix
  ];

  options.nixDots.packages.cli = {
    pkgArray.enable = lib.mkEnableOption "Enables array";
  };

  config = lib.mkIf config.nixDots.packages.cli.pkgArray.enable {
    hm.home.packages = with pkgs; [
      tree
      bat
      eza
      kew
      nsnake
      ninvaders
      ranger
    ];
  };
}
