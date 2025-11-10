{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gui = {
    foot.enable = lib.mkEnableOption "Enables foot terminal";
  };

  config = lib.mkIf config.nixorcism.packages.gui.foot.enable {
    hm.programs.foot = {
      enable = true;
    };
  };
}
