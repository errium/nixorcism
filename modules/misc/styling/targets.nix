{
  config,
  lib,
  ...
}: {
  config = lib.mkIf config.nixorcism.misc.styling.enable {
    stylix.targets = {};

    hm.stylix.targets = {
      librewolf.profileNames = ["default"];
      noctalia-shell.enable = false;
      opencode.enable = false;
    };
  };
}
