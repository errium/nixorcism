{
  flake.modules.nixos.core = {
    config,
    lib,
    ...
  }: let
    username = config.nixorcism.username;
  in {
    options.nixorcism.confDir = lib.mkOption {
      type = lib.types.str;
      description = "Absolute path to the config directory on the target system.";
      default = "/home/${username}/nixorcism";
    };

    config = {
      # i18n
      i18n.defaultLocale = "en_US.UTF-8";
      time.timeZone = "Europe/Vilnius";

      # sudo
      security.sudo = {
        enable = true;
        extraConfig = ''
          Defaults passwd_timeout=0
          Defaults timestamp_timeout=15
        '';
      };

      # zram
      zramSwap = {
        enable = true;
        algorithm = "lz4";
        memoryPercent = 50;
        priority = 100;
      };
    };
  };
}
