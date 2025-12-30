{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.mango.nixosModules.mango];

  options.nixorcism.desktop.window-managers = {
    mangowc.enable = lib.mkEnableOption "Enables mangowc";
  };

  config = lib.mkIf config.nixorcism.desktop.window-managers.mangowc.enable {
    programs.mango.enable = true;

    hm = let
      appearance = import ./appearance.nix;
      binds = import ./binds.nix;
      input-devices = import ./inputs.nix;
      layout = import ./layout.nix;
      misc = import ./misc.nix;
    in {
      imports = [inputs.mango.hmModules.mango];

      wayland.windowManager.mango = {
        enable = true;
        settings =
          ''''
          + appearance
          + binds
          + input-devices
          + layout
          + misc;
        # autostart_sh = {};
      };
    };
  };
}
