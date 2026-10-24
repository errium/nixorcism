{
  flake.modules.nixos.display-managers'gdm = {config, ...}: let
    hostname = config.networking.hostName;
  in {
    services.displayManager.gdm = {
      enable = true;
      autoSuspend = true;
      banner = hostname; # WARN
    };
  };
}
