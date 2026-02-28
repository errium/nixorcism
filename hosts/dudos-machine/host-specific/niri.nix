{
  flake.modules.nixos.dudos-machine = {
    config,
    lib,
    ...
  }: let
    cfg = config.programs.niri.enable;
  in {
    hm.programs.niri.settings = lib.mkIf cfg {
      outputs."BOE 0x0B38 0x00000003" = {
        mode = {
          width = 2560;
          height = 1600;
          refresh = 165.002;
        };
        scale = 1;
        variable-refresh-rate = true;
      };

      debug = {
        honor-xdg-activation-with-invalid-serial = {};
        ignore-drm-device = "/dev/dri/by-path/pci-0000:01:00.0-render";
        render-drm-device = "/dev/dri/by-path/pci-0000:06:00.0-render";
      };
    };
  };
}
