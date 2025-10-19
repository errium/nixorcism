{lib, ...}: {
  imports = [
    ./packages.nix
    ./git.nix
    ./helix.nix
    ./fastfetch.nix
  ];

  nixDots.packages.cli = lib.mkDefault {
    fastfetch.enable = false;
  };
}
