{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.gui = {
    librewolf.enable = lib.mkEnableOption "Enables librewolf";
  };

  config = lib.mkIf config.nixorcism.packages.gui.librewolf.enable {
    hm.programs.librewolf = {
      enable = true;
    };
  };
}
