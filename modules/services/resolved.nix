{
  config,
  lib,
  ...
}: {
  options.nixorcism.services.resolved = {
    enable = lib.mkEnableOption "systemd-resolved";
  };

  config = lib.mkIf config.nixorcism.services.resolved.enable {
    services.resolved = {
      enable = true;

      settings.Resolve = {
        DNS = ["9.9.9.9" "149.112.112.112"];
        DNSOverTLS = true;
        DNSSEC = true;
      };
    };
  };
}
