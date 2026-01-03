{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
    ./host-specific
  ];

  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;
  networking.hostName = "dudos-machine";
  system.stateVersion = "25.11";

  nixorcism = {
    core = {
      bootloader = "limine";
    };

    desktop = {
      display-manager = "sddm";
      desktop-shells.noctalia.enable = true;
      window-managers.mangowc.enable = true;
      sound.enable = true;
      xkb.enable = true;
    };

    misc = {
      kvm.enable = true;
      stylix.enable = true;
    };

    packages = {
      cli = {
        pkgArray.enable = true;
        btop.enable = true;
        cava.enable = true;
        fastfetch.enable = true;
        fzf.enable = true;
        git.enable = true;
        helix.enable = true;
        nh.enable = true;
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
