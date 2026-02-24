{config, ...}: {
  flake.modules.nixos.virtual-nix = {pkgs, ...}: {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    networking.hostName = "virtual-nix";
    system.stateVersion = "25.11";

    imports =
      (with config.flake.modules.nixos; [
        # base/*
        base
        bootloader_limine

        # desktop/*
        desktop_sound
        desktop_xkb
        desktop-environment_xfce
        display-manager_ly

        # features/*
        theming_dynamic

        # programs/cli/*
        cli_packages
        cli_bat
        cli_comma
        cli_eza
        cli_fzf
        cli_git
        cli_nh
        cli_nix-index
        cli_zoxide

        # programs/editors/*
        editor_helix

        # programs/gui/*
        gui_foot

        # services/*
        service_openssh

        # shell/*
        shell_common
        shell_bash
        shell_fish
        shell_starship
      ])
      ++ [./_hardware-configuration.nix];
  };
}
