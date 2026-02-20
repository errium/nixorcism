{
  config,
  pkgs,
  ...
}: {
  flake.modules.nixos.bash = {
    programs.fish = {
      enable = true;
      shellInit = ''
        set -U fish_greeting ""
      '';
    };

    environment.systemPackages = with pkgs.fishPlugins; [
      bang-bang
      done
      sponge
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
