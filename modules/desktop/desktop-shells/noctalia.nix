{
  config,
  inputs,
  lib,
  ...
}: {
  options.nixorcism.desktop.desktop-shells = {
    noctalia.enable = lib.mkEnableOption "Whether to enable noctalia shell";
  };

  config = lib.mkIf config.nixorcism.desktop.desktop-shells.noctalia.enable {
    hm = {
      imports = [inputs.noctalia.homeModules.default];
      programs.noctalia-shell.enable = true;
    };
  };
}
