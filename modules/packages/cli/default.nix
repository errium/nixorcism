{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./btop.nix
    ./cava.nix
    ./git.nix
    ./helix.nix
    ./fastfetch.nix
  ];

  options.nixorcism.packages.cli = {
    pkgArray.enable = lib.mkEnableOption "Enables array";
  };

  config = lib.mkIf config.nixorcism.packages.cli.pkgArray.enable {
    hm.home.packages = with pkgs; [
      tree
      bat
      eza
      kew
      nsnake
      ninvaders
      ranger
      toilet
      figlet
    ];
  };
}
