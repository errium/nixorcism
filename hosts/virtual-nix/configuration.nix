{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  networking.hostName = "virtual-nix";
  system.stateVersion = "25.11";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  nixorcism = {
    stylix.enable = true;
  };

  nixorcism.desktop = {
    ly.enable = true;
    sound.enable = true;
    xfce.enable = true;
    xkb.enable = true;
  };

  nixorcism.packages = {
    cli = {
      btop.enable = true;
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
      pkgArray.enable = true;
    };
  };

  nixorcism.services = {
    ssh.enable = true;
  };

  nixorcism.shell = {
    userShell = "fish";
    userPrompt = "starship";
    aliases.enable = true;
    bash.enable = true;
    fish.enable = true;
    zsh.enable = true;
  };

  #=======================

  boot.loader.grub.useOSProber = false;
}
