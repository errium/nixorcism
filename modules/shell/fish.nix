{
  flake.modules.nixos.shell_fish = {pkgs, ...}: {
    imports = [./_common.nix];

    programs.fish = {
      enable = true;
      shellInit = ''set -U fish_greeting ""'';
    };

    environment.systemPackages =
      (with pkgs.fishPlugins; [
        bang-bang
        done
      ])
      ++ (with pkgs; [
        # Needed for done plugin
        jq
        libnotify
      ]);

    hm.programs.fish = {
      enable = true;
      preferAbbrs = true;
    };
  };
}
