{
  config,
  lib,
  ...
}: {
  options.nixDots.desktop = {
    hyprland.enable = lib.mkEnableOption "Enables hyprland";
  };

  config = lib.mkIf config.nixDots.desktop.hyprland.enable {
    programs.hyprland.enable = true;
    hm = {};
  };
}
