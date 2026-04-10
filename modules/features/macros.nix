{
  flake.modules.nixos.feature_macros = {
    pkgs,
    username,
    ...
  }: {
    programs.ydotool.enable = true;
    users.groups.ydotool.members = [username];

    hm.home.packages = let
      albion-reaper = pkgs.writeShellScriptBin "albion-reaper" ''
        # W
        ydotool key 17:1 17:0
        sleep 0.15

        # E
        ydotool key 18:1 18:0
        sleep 0.15

        # Q
        ydotool key 16:1 16:0
        sleep 0.15

        # Q
        ydotool key 16:1 16:0
      '';
    in [albion-reaper];
  };
}
