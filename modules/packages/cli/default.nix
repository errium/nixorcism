{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./btop.nix
    ./cava.nix
    ./fastfetch.nix
    ./git.nix
    ./helix.nix
    ./nix-search-tv.nix
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
      pipes
      tty-clock
    ];
  };
}
