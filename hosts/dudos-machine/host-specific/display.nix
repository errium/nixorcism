{
  flake.modules.nixos.dudos-machine = {
    config,
    lib,
    ...
  }: let
    display = {
      name = "BOE 0x0B38 0x00000003";
      width = 2560;
      height = 1600;
      refresh = 165.002;
    };
  in {
    # ┏┓╻╻┏━┓╻
    # ┃┗┫┃┣┳┛┃
    # ╹ ╹╹╹┗╸╹
    hm.programs.niri.settings = lib.mkIf config.programs.niri.enable {
      outputs.${display.name} = {
        mode = {inherit (display) width height refresh;};
        scale = 1;
        variable-refresh-rate = true;
      };

      # No better place for this
      debug = {
        honor-xdg-activation-with-invalid-serial = {};
        ignore-drm-device = "/dev/dri/by-path/pci-0000:01:00.0-render";
        render-drm-device = "/dev/dri/by-path/pci-0000:06:00.0-render";
      };
    };

    # ┏━┓╻ ╻┏━┓╻ ╻
    # ┗━┓┃╻┃┣━┫┗┳┛
    # ┗━┛┗┻┛╹ ╹ ╹
    hm.wayland.windowManager.sway.config = lib.mkIf config.programs.sway.enable {
      output.${display.name} = {
        mode = "${toString display.width}x${toString display.height}@${toString display.refresh}Hz";
        adaptive_sync = "on";
      };
    };
  };
}
