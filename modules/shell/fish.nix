{
  flake.modules.nixos.shell'fish = {
    config,
    pkgs,
    ...
  }: {
    programs.fish = {
      enable = true;
      shellInit = ''set -U fish_greeting ""'';
    };

    hj.rum.programs.fish = {
      enable = true;
      abbrs = config.nixorcism.shellAliases;
      plugins = {
        inherit (pkgs.fishPlugins) bang-bang done;
      };
    };

    hj.packages = with pkgs; [
      # needed for done
      jq
      libnotify
    ];

    nixorcism.preserve.user.directories = [
      ".cache/fish"
      ".local/share/fish"
    ];

    users.defaultUserShell = pkgs.fish;
  };
}
