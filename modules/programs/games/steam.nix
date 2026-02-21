{
  flake.modules.nixos.games_steam = {pkgs, ...}: {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;

    hm = {
      home.packages = with pkgs; [protonup-ng];
      home.sessionVariables.STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
    };
  };
}
