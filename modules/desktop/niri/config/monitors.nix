{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    hm = {
      programs.niri.settings.outputs = {
        eDP-1 = {
          mode = "2560x1600@165.002";
          scale = 1;
          variable-refresh-rate = true;
        };
      };
    };
  };
}
