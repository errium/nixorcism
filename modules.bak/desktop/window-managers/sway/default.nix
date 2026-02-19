{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./appearance.nix
    ./inputs.nix
    ./keybinds.nix
    ./misc.nix
  ];

  options.nixorcism.desktop.window-managers.sway = {
    enable = lib.mkEnableOption "Sway";
  };

  config = lib.mkIf config.nixorcism.desktop.window-managers.sway.enable {
    programs.sway = {
      enable = true;
      extraOptions = ["--unsupported-gpu"];
    };

    hm.wayland.windowManager.sway = {
      enable = true;
      extraOptions = ["--unsupported-gpu"];

      config.startup = [
        {command = "foot --server &";}
        {command = "wl-paste --watch cliphist store";}
      ];
    };

    hm.home.packages = with pkgs; [
      brightnessctl
      cliphist
      playerctl
      wl-clip-persist
      wl-clipboard
    ];
  };
}
