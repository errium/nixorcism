{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [inputs.mango.nixosModules.mango];

  options.nixorcism.desktop.window-managers.mangowc = {
    enable = lib.mkEnableOption "MangoWC";
  };

  config = lib.mkIf config.nixorcism.desktop.window-managers.mangowc.enable {
    programs.mango.enable = true;

    hm = let
      appearance = import ./appearance.nix;
      binds = import ./binds.nix;
      input-devices = import ./inputs.nix;
      layout = import ./layout.nix;
      misc = import ./misc.nix;
    in {
      imports = [inputs.mango.hmModules.mango];

      home.packages = with pkgs; [
        cliphist
        wl-clip-persist
        wl-clipboard
      ];

      wayland.windowManager.mango = {
        enable = true;
        autostart_sh = ''
          dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wlroots
          wl-clip-persist --clipboard regular --reconnect-tries 0 &
          wl-paste --type text --watch cliphist store &
          noctalia-shell &
          foot --server &
        '';
        settings =
          ''
            exec-once=~/.config/mango/autostart.sh
          ''
          + appearance
          + binds
          + input-devices
          + layout
          + misc;
      };
    };
  };
}
