{
  lib,
  pkgs,
  ...
}: {
  options.nixorcism.font = {
    serif = lib.mkOption {type = lib.types.str;};
    sans = lib.mkOption {type = lib.types.str;};
    mono = lib.mkOption {type = lib.types.str;};
    emoji = lib.mkOption {type = lib.types.str;};
  };

  config = {
    nixorcism.font = {
      serif = "Noto Serif";
      sans = "Noto Sans";
      mono = "IosevkaTerm Nerd Font";
      emoji = "Noto Color Emoji";
    };

    fonts.packages = with pkgs; [
      dejavu_fonts
      liberation_ttf
      nerd-fonts.iosevka-term
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
    ];
  };
}
