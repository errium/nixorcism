{
  config,
  inputs,
  lib,
  ...
}: {
  options.nixorcism.desktop.desktop-shells.noctalia = {
    enable = lib.mkEnableOption "noctalia-shell";
  };

  config = lib.mkIf config.nixorcism.desktop.desktop-shells.noctalia.enable {
    services.upower.enable = true;

    hm = {
      imports = [inputs.noctalia.homeModules.default];
      programs.noctalia-shell = {
        enable = true;
        systemd = {
          enable = true;
          target = "sway-session.target";
        };
      };
    };
  };
}
