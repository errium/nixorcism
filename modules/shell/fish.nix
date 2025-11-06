{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.shell = {
    fish.enable = lib.mkEnableOption "Enables fish";
  };

  config = lib.mkIf config.nixorcism.shell.fish.enable {
    programs.fish = {
      enable = true;
    };

    environment.systemPackages = with pkgs.fishPlugins; [
      bang-bang
      colored-man-pages
      done
      sponge
    ];

    hm.programs.fish = {
      enable = true;
      preferAbbrs = true;

      shellAbbrs = let
        confDir = "~/nixorcism";
        sudo = "sudo";
      in {
        ll = "eza -l";
        la = "eza -a";
        ff = "fastfetch";

        nrs = "${sudo} nixos-rebuild switch --flake ${confDir}";
        gen = "${sudo} nix-env -p /nix/var/nix/profiles/system --list-generations";
        ngc = "${sudo} nix-collect-garbage -d";
        upd = "nix flake update --flake ${confDir}";
        upg = "${sudo} nixos-rebuild switch --upgrade --flake ${confDir}";
      };
    };

    hm.programs = {
      fzf = {
        enable = true;
        enableFishIntegration = true;
      };
      command-not-found = {
        enable = true;
      };
    };
  };
}
