{
  config,
  lib,
  ...
}: {
  options.nixorcism.services = {
    ssh.enable = lib.mkEnableOption "Enables ssh";
  };

  config = lib.mkIf config.nixorcism.services.ssh.enable {
    services.openssh.enable = true;
  };
}
