{pkgs, ...}: {
  imports = [
    ./bluetooth.nix
    ./btrfs.nix
    ./env-vars.nix
    ./grub.nix
    ./nvidia.nix
  ];

  hm.home.packages = with pkgs; [
    gcc
    go
    inkscape
  ];
}
