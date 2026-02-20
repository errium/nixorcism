{
  flake.modules.nixos.sudo = {
    security.sudo = {
      enable = true;

      extraConfig = ''
        Defaults passwd_timeout=0
        Defaults timestamp_timeout=15
      '';
    };
  };
}
