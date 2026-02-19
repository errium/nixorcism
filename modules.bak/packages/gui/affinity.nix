{
  config,
  inputs,
  lib,
  ...
}: {
  options.nixorcism.packages.gui.affinity = {
    enable = lib.mkEnableOption "Affinity";
  };

  config = lib.mkIf config.nixorcism.packages.gui.affinity.enable {
    hm.home.packages = [inputs.affinity-nix.packages.x86_64-linux.v3];
  };
}
