{
  config,
  lib,
  ...
}: {
  options.nixorcism.packages.cli = {
    git.enable = lib.mkEnableOption "Enables git";
  };

  config = lib.mkIf config.nixorcism.packages.cli.git.enable {
    programs.git.enable = true;
  };
}
