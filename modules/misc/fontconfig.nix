{
  config,
  lib,
  ...
}: {
  options.nixorcism.misc.fontconfig = {
    enable = lib.mkEnableOption "Whether to enable fontconfig configuration";
  };

  config = lib.mkIf config.nixorcism.misc.fontconfig.enable {
    hm.fonts.fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [
          config.nixorcism.font.serif
          "DejaVu Serif"
        ];
        sansSerif = [
          config.nixorcism.font.sans
          "DejaVu Sans"
        ];
        monospace = [
          config.nixorcism.font.mono
          "DejaVu Sans Mono"
        ];
        emoji = [
          config.nixorcism.font.emoji
          "Noto Color Emoji"
        ];
      };
    };
  };
}
