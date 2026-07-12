{
  flake.modules.nixos.fish = {
    config,
    pkgs,
    ...
  }: {
    users.defaultUserShell = pkgs.fish;

    programs.fish = {
      enable = true;
      shellInit = ''set -U fish_greeting ""'';
      shellAbbrs = config.nixorcism.shellAliases;
    };

    environment.systemPackages = with pkgs; [
      fishPlugins.bang-bang
      fishPlugins.done

      # needed for done
      jq
      libnotify
    ];
  };
}
