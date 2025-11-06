{
  config,
  lib,
  pkgs,
  username,
  ...
}: {
  options.nixorcism.shell = {
    fish.enable = lib.mkEnableOption "Enables fish";
  };

  config = lib.mkIf config.nixorcism.shell.fish.enable {
    users.users.${username}.shell = pkgs.fish;

    programs.fish = {
      enable = true;

      shellAliases = {
        c = "clear";
        ll = "eza -l";
        la = "eza -a";
        ff = "fastfetch";
      };
    };

    hm.programs.fish = {
      enable = true;

      shellAliases = let
        confDir = "~/nixorcism";
        sudo = "sudo";
      in {
        nrs = "${sudo} nixos-rebuild switch --flake ${confDir}";
        gen = "${sudo} nix-env -p /nix/var/nix/profiles/system --list-generations";
        ngc = "${sudo} nix-collect-garbage -d";
        upd = "nix flake update --flake ${confDir}";
        upg = "${sudo} nixos-rebuild switch --upgrade --flake ${confDir}";
      };
    };

    hm.programs = {
      starship = {
        enableFishIntegration = true;
      };
      fzf = {
        enable = true;
        enableFishIntegration = true;
      };
      zoxide = {
        enable = true;
        enableFishIntegration = true;
        options = ["--cmd cd"];
      };
      command-not-found = {
        enable = true;
      };
    };
  };
}