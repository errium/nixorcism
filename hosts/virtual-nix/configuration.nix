{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "virtual-nix";
  system.stateVersion = "25.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixDots.packages.cli = {
    pkgArray.enable = true;
    btop.enable = true;
    fastfetch.enable = true;
    git.enable = true;
    helix.enable = true;
  };

  nixDots.packages.gui = {
    pkgArray.enable = true;
    alacritty.enable = true;
    librewolf.enable = true;
  };

  #=======================

  boot.loader.grub.useOSProber = false;
}
