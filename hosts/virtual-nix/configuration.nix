{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  boot.kernelPackages = pkgs.linuxPackages_latest;
  networking.hostName = "virtual-nix";
  system.stateVersion = "25.11";

  nixorcism = {
    core = {
      bootloader = "limine";
    };

    desktop = {
      display-manager = "sddm";
      desktop-environments.xfce.enable = true;
      sound.enable = true;
      xkb.enable = true;
    };

    misc = {
      stylix.enable = true;
    };

    packages = {
      cli = {
        pkgArray.enable = true;
        btop.enable = true;
        fastfetch.enable = true;
        fzf.enable = true;
        git.enable = true;
        helix.enable = true;
        nh.enable = true;
        nix-search-tv.enable = true;
        opencode.enable = true;
        zoxide.enable = true;
      };
      gui = {
        alacritty.enable = true;
        librewolf.enable = true;
      };
    };

    services = {
      openssh.enable = true;
    };

    shell = {
      userShell = "fish";
      userPrompt = "starship";
      bash.enable = true;
      fish.enable = true;
    };
  };
}
