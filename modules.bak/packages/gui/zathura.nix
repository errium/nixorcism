
{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gui.zathura= {
    enable = lib.mkEnableOption "Zathura";
  };

  config = lib.mkIf config.nixorcism.packages.gui.zathura.enable {
    hm.programs.zathura = {
      enable = true;

      options = {
        recolor = true;
      };

      mappings = {
        i = "recolor";
      };
    };
  };
}
