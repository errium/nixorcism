{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gui.foot = {
    enable = lib.mkEnableOption "Whether to enable foot terminal";
  };

  config = lib.mkIf config.nixorcism.packages.gui.foot.enable {
    hm.programs.foot = {
      enable = true;
      server.enable = true;

      settings = {
        main.font = config.nixorcism.font.mono + ":size=14";
        cursor.style = "beam";
        colors.alpha = 0.85;
      };
    };
  };
}
