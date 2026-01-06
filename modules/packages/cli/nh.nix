{
  confDir,
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli.nh = {
    enable = lib.mkEnableOption "Nix Helper (nh)";
  };

  config = lib.mkIf config.nixorcism.packages.cli.nh.enable {
    hm.programs.nh = {
      enable = true;
      flake = confDir;

      clean = {
        enable = true;
        dates = "daily";
        extraArgs = "--keep 3";
      };
    };
  };
}
