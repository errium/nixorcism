{
  config,
  lib,
  ...
}: {
  options.nixDots.packages.cli = {
    git.enable = lib.mkEnableOption "Enables git";
  };

  config = lib.mkIf config.nixDots.packages.cli.git.enable {
    programs.git.enable = true;
  };
}
