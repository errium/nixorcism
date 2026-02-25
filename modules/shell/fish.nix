{
  flake.modules.nixos.shell_fish = {pkgs, ...}: {
    programs.fish = {
      enable = true;
      shellInit = ''set -U fish_greeting ""'';
    };

    environment.systemPackages = with pkgs.fishPlugins; [
      bang-bang
      done
    ];

    hm.programs.fish = {
      enable = true;
      preferAbbrs = true;
    };
  };
}
