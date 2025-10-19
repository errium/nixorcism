{lib, ...}: {
  imports = [
    ./packages.nix
    ./git.nix
    ./helix.nix
    ./fastfetch.nix
  ];

  nixDots.packages.cli = lib.mkDefault {
    git.enable = true;
    fastfetch.enable = true;
    helix.enable = true;
  };
}
