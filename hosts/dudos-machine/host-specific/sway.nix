{
  flake.modules.nixos.dudos-machine = {
    config,
    lib,
    ...
  }: let
    cfg = config.programs.sway.enable;
  in {
    hm.wayland.windowManager.sway.config = lib.mkIf cfg {
      output = {
        "BOE 0x0B38 0x00000003" = {
          mode = ''2560x1600@165.002Hz'';
          adaptive_sync = "on";
        };
      };
    };
  };
}
