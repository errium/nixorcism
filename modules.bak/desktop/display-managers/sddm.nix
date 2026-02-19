{
  config,
  lib,
  ...
}: {
  config = lib.mkIf (config.nixorcism.desktop.display-manager == "sddm") {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };
}
