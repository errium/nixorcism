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
  };
}
