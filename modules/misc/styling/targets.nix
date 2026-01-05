{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.misc.styling.enable {
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
