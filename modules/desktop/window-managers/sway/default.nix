{
  config,
  lib,
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

      config.startup = [
        {command = "foot --server &";}
      ];
    };
  };
}
