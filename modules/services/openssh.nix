{
  config,
  lib,
  ...
}: {
  options.nixorcism.services = {
    openssh.enable = lib.mkEnableOption "Enables openssh";
  };

  config = lib.mkIf config.nixorcism.services.openssh.enable {
    services.openssh.enable = true;
  };
}
