{
  config,
  lib,
  ...
}: {
  options.nixorcism.services.openssh = {
    enable = lib.mkEnableOption "openssh";
  };

  config = lib.mkIf config.nixorcism.services.openssh.enable {
    services.openssh.enable = true;
  };
}
