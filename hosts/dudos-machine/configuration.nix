{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ./host-specific
  ];

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  networking.hostName = "dudos-machine";
  system.stateVersion = "25.11";
}
