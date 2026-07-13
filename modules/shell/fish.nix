{
  flake.modules.nixos.shell'fish = {
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

    userPackages = with pkgs; [
      fishPlugins.bang-bang
      fishPlugins.done

      # needed for done
      jq
      libnotify
    ];

    nixorcism.preserve.user = {
      directories = [".cache/fish"];
      files = [".local/share/fish/fish_history"];
    };
  };
}
