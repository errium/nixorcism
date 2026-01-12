{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./host-specific
    ../../modules
  ];

  boot.kernelPackages = pkgs.linuxPackages_zen;
  networking.hostName = "dudos-machine";
  system.stateVersion = "25.11";

  nixorcism = {
    core = {
      bootloader = "grub";
    };

    desktop = {
      desktop-shells = {
        noctalia.enable = true;
      };
      window-managers = {
        niri.enable = true;
      };
      display-manager = "gdm";
      sound.enable = true;
      xkb.enable = true;
    };

    misc = {
      kvm.enable = true;
      styling.enable = true;
    };

    packages = {
      cli = {
        pkgArray.enable = true;
        bat.enable = true;
        btop.enable = true;
        cava.enable = true;
        comma.enable = true;
        eza.enable = true;
        fastfetch.enable = true;
        fzf.enable = true;
        git.enable = true;
        helix.enable = true;
        nh.enable = true;
        nix-index.enable = true;
        nix-search-tv.enable = true;
        opencode.enable = true;
        zoxide.enable = true;
      };
      gaming = {
        pkgArray.enable = true;
        steam.enable = true;
      };
      gui = {
        pkgArray.enable = true;
        foot.enable = true;
        librewolf.enable = true;
        spicetify.enable = true;
        vesktop.enable = true;
      };
    };

    services = {
      auto-cpufreq.enable = true;
      openssh.enable = true;
      udiskie.enable = true;
    };

    shell = {
      userShell = "fish";
      userPrompt = "starship";
      bash.enable = true;
      fish.enable = true;
    };
  };
}
