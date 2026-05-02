{
  flake.modules.nixos.window-manager_sway = {
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
  };
}
