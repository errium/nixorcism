{pkgs, ...}: {
  imports = [
    ./btop.nix
    ./git.nix
    ./helix.nix
    ./fastfetch.nix
  ];

  hm.home.packages = with pkgs; [
    tree
    bat
    eza
    kew
    nsnake
    ninvaders
    ranger
  ];
}
