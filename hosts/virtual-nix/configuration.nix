{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "virtual-nix";
  system.stateVersion = "25.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixDots = {
    packages = {
      cli = {
        btop.enable = true;
        fastfetch.enable = true;
        git.enable = true;
        helix.enable = true;
      };

      gui = {
        alacritty.enable = true;
      };
    };
  };

  #=======================

  boot.loader.grub.useOSProber = false;
  programs.firefox.enable = true;
}
