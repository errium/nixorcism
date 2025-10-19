{lib, ...}: {
  imports = [
    ./packages.nix

    ./btop.nix
    ./git.nix
    ./helix.nix
    ./fastfetch.nix
  ];

  nixDots.packages.cli = lib.mkDefault {
    btop.enable = true;
    git.enable = true;
    fastfetch.enable = true;
    helix.enable = true;
  };
}
