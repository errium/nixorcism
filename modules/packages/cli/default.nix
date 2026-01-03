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
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./nh.nix
    ./nix-index.nix
    ./nix-search-tv.nix
    ./opencode.nix
    ./zoxide.nix
  ];

  options.nixorcism.packages.cli = {
    pkgArray.enable = lib.mkEnableOption "Enables array";
  };

  config = lib.mkIf config.nixorcism.packages.cli.pkgArray.enable {
    hm.home.packages = with pkgs; [
      bat
      dysk
      eza
      figlet
      gdu
      terminal-toys
      toilet
      tree
      tty-clock
      yazi
    ];
  };
}
