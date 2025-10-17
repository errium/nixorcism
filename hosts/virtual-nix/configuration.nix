{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "virtual-nix";
  system.stateVersion = "25.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.grub.useOSProber = false;

  #=======================

  programs.firefox.enable = true;
}
