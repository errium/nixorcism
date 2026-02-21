{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.shell.fish = {
    enable = lib.mkEnableOption "fish";
  };

  config = lib.mkIf config.nixorcism.shell.fish.enable {
    programs.fish = {
      enable = true;
      shellInit = ''
        set -U fish_greeting ""
      '';
    };

    environment.systemPackages = with pkgs.fishPlugins; [
      bang-bang
      done
    ];

    hm.programs.fish = {
      enable = true;
      preferAbbrs = true;
      shellAbbrs = config.nixorcism.shell.aliases;
    };

    hm.programs = {
      command-not-found = {
        enable = true;
      };
    };
  };
}
