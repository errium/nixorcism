{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./host-specific
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
      desktop-environments.xfce.enable = true;
      display-manager = "ly";
      sound.enable = true;
      xkb.enable = true;
    };

    misc = {
      styling.enable = true;
    };

    packages = {
      cli = {
        bat.enable = true;
        comma.enable = true;
        eza.enable = true;
        fzf.enable = true;
        git.enable = true;
        nh.enable = true;
        nix-index.enable = true;
        pkgArray.enable = true;
        zoxide.enable = true;
      };
      editors = {
        helix.enable = true;
      };
      gui = {
        foot.enable = true;
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
