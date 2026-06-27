{
  flake.modules.nixos.core = {
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
    # It's a part of core module because
    # I want ZRAM on all my machines.
    zramSwap = {
      enable = true;
      algorithm = "lz4";
      memoryPercent = 50;
      priority = 100;
    };
  };
}
