{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  networking.hostName = "dudos-machine";
  system.stateVersion = "25.11";
}
