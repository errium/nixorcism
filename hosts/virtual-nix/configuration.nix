{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/core
    ../../modules/desktop
  ];

  networking.hostName = "virtual-nix";
  system.stateVersion = "25.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.loader.grub.useOSProber = false;

  #=======================

  programs.git.enable = true;
  services.openssh.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    helix
    fastfetch
  ];
}
