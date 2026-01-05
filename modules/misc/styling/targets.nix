{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.stylix.enable {
    stylix.targets = {
      fontconfig.enable = false;
    };

    hm.stylix.targets = {
      fontconfig.enable = false;
      librewolf.profileNames = ["default"];
      noctalia-shell.enable = false;
    };
  };
}
