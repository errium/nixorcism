{
  config,
  lib,
  ...
}: {
  options.nixorcism.desktop.window-managers.niri = {
    enable = lib.mkEnableOption "niri";
  };

  config = lib.mkIf config.nixorcism.desktop.window-managers.niri.enable {
    # TODO
    # All this
    # Yeah, I need niri
    # MangoWC is nice, but I'm used to niri
    # I miss it :/
  };
}
