{
  flake.modules.nixos.display-managers'gdm = {config, ...}: let
    inherit (config.networking) hostName;
  in {
    services.displayManager.gdm = {
      enable = true;
      autoSuspend = true;
      banner = hostName; # WARN
    };
  };
}
