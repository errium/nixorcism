{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "virtual-nix";
  system.stateVersion = "25.05";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixorcism.desktop = {
    ly.enable = true;
    sound.enable = true;
    xfce.enable = true;
    xkb.enable = true;
    niri.enable = true;
  };

  nixorcism.packages = {
    cli = {
      pkgArray.enable = true;
      btop.enable = true;
      fastfetch.enable = true;
      git.enable = true;
      helix.enable = true;
    };

    gui = {
      pkgArray.enable = true;
      alacritty.enable = true;
      librewolf.enable = true;
      spicetify.enable = true;
    };
  };

  nixorcism.shell = {
    zsh.enable = true;
    oh-my-posh.enable = true;
  };

  #=======================

  boot.loader.grub.useOSProber = false;
}
