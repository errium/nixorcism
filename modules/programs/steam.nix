{
  flake.modules.nixos.programs'steam = {pkgs, ...}: {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };

    programs.gamemode = {
      enable = true;
      enableRenice = true;

      settings.general = {
        renice = 10;
        softrealtime = "auto";
      };

      settings.custom = {
        start = "${pkgs.libnotify}/bin/notify-send 'gamemode' 'on'";
        end = "${pkgs.libnotify}/bin/notify-send 'gamemode' 'off'";
      };
    };

    nixorcism.preserve.user.directories = [
      ".cache/mesa_shader_cache"
      ".cache/nvidia"
      ".config/unity3d"
      ".local/share/Steam"
      ".nv"
      ".steam"
    ];
  };
}
