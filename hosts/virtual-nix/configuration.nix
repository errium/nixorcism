{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "virtual-nix";
  system.stateVersion = "25.11";

  nixorcism.core = {
    bootloader = "limine";
  };

  nixorcism.misc = {
    stylix.enable = true;
  };

  nixorcism.desktop = {
    display-managers.ly.enable = true;
    window-managers.mangowc.enable = true;
    sound.enable = true;
    desktop-environments.xfce.enable = true;
    xkb.enable = true;
  };

  nixorcism.packages = {
    cli = {
      fastfetch.enable = true;
      fzf.enable = true;
      git.enable = true;
      helix.enable = true;
      nh.enable = true;
      nix-search-tv.enable = true;
      opencode.enable = true;
      pkgArray.enable = true;
      zoxide.enable = true;
    };

    gui = {
      alacritty.enable = true;
      librewolf.enable = true;
    };
  };

  nixorcism.services = {
    openssh.enable = true;
  };

  nixorcism.shell = {
    userShell = "fish";
    userPrompt = "starship";
    fish.enable = true;
  };
}
