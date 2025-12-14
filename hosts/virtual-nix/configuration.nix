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
      pkgArray.enable = true;
      btop.enable = true;
      fastfetch.enable = true;
      git.enable = true;
      helix.enable = true;
      zoxide.enable = true;
      fzf.enable = true;
      opencode.enable = true;
      nix-search-tv.enable = true;
    };

    gui = {
      pkgArray.enable = true;
      alacritty.enable = true;
    };
  };

  nixorcism.services = {
    ssh.enable = true;
  };

  nixorcism.shell = {
    userShell = "fish";
    userPrompt = "starship";
    aliases.enable = true;
    zsh.enable = true;
    fish.enable = true;
    bash.enable = true;
  };

  #=======================

  boot.loader.grub.useOSProber = false;
}
