{
  config,
  inputs,
  lib,
  ...
}: {
  imports = [inputs.nix-index-database.nixosModules.default];

  options.nixorcism.packages.cli.comma = {
    enable = lib.mkEnableOption "comma";
  };

  config = lib.mkIf config.nixorcism.packages.cli.comma.enable {
    programs.nix-index-database.comma.enable = true;
  };
}
