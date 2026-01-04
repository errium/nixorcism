{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "virtual-nix";
  system.stateVersion = "25.11";

  nixorcism = {};
}
