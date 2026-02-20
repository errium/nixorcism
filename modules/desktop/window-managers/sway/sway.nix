{
  flake.modules.nixos.sway = {pkgs, ...}: {
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
