{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
  ];

  networking.hostName = "dudos-machine";

  system.stateVersion = "25.05";
  nixpkgs.config.allowUnfree = true;
  documentation.nixos.enable = false;
  boot.kernelPackages = pkgs.linuxPackages_zen;
  hardware.cpu.amd.updateMicrocode = true;

  time.timeZone = "Europe/Vilnius";
  i18n.defaultLocale = "ru_RU.UTF-8";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [
      "compress=zstd"
      "noatime"
    ];
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };
}
