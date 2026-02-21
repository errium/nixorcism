{config, ...}: {
  flake.modules.nixos.dudos-machine = {pkgs, ...}: {
    boot.kernelPackages = pkgs.linuxPackages_zen;
    networking.hostName = "dudos-machine";
    system.stateVersion = "25.11";

    imports =
      (with config.flake.modules.nixos; [
        # base/*
        base
        bootloader_grub

        # desktop/*
        desktop_sound
        desktop_xkb
        display-manager_ly
        window-manager_niri
        wm-utils_noctalia

        # features/*
        feature_kvm

        # programs/cli/*
        cli_packages
        cli_bat
        cli_btop
        cli_cava
        cli_comma
        cli_eza
        cli_fastfetch
        cli_fzf
        cli_git
        cli_nh
        cli_nix-index
        cli_nix-search-tv
        cli_opencode
        cli_zoxide

        # programs/editors/*
        editor_doom-emacs
        editor_helix
        editor_vscodium

        # programs/games
        games_packages
        games_steam
  
        # programs/gui/*
        gui_spicetify
        gui_foot
        gui_librewolf
        gui_packages
        gui_vesktop
        gui_zathura

        # services/*
        service_auto-cpufreq
        service_openrgb
        service_openssh
        service_udiskie

        # shell/*
        shell_common
        shell_bash
        shell_fish
        shell_starship
      ])
      ++ [./_hardware-configuration.nix];
  };
}
