{
  config,
  lib,
  ...
}: {
  options.nixDots.packages.gui = {
    librewolf.enable = lib.mkEnableOption "Enables librewolf";
  };

  config = lib.mkIf config.nixDots.packages.gui.librewolf.enable {
    hm.programs.librewolf = {
      enable = true;
    };
  };
}
