{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.desktop.niri.enable {
    hm = {
      # programs.niri.settings.spawn-at-startup = [{}];
    };
  };
}
