{
  config,
  lib,
  ...
}: {
  imports = [
    ./config
  ];

  options.nixDots.desktop = {
    sway.enable = lib.mkEnableOption "Enables sway";
  };

  config = lib.mkIf config.nixDots.desktop.sway.enable {
    programs.sway = {
      enable = true;
      xwayland.enable = true;
      wrapperFeatures.gtk = true;
    };

    hm = {
      wayland.windowManager.sway = {
        enable = true;
      };
    };
  };
}
