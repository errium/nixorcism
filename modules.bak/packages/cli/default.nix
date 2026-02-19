{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
    ./btop.nix
    ./cava.nix
    ./comma.nix
    ./eza.nix
    ./fastfetch.nix
    ./fzf.nix
    ./git.nix
    ./nh.nix
    ./nix-index.nix
    ./nix-search-tv.nix
    ./opencode.nix
    ./zellij.nix
    ./zoxide.nix
  ];

  options.nixorcism.packages.cli = {
    pkgArray.enable = lib.mkEnableOption "Enables array";
  };

  config = lib.mkIf config.nixorcism.packages.cli.pkgArray.enable {
    hm.home.packages = with pkgs; [
      dysk
      fd
      gdu
      ripgrep
      tree
      yazi
    ];
  };
}
