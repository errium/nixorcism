{
  flake.modules.nixos.service_kde-connect = {
    programs.kdeconnect.enable = true;
  };
}
