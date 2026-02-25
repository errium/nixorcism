{
  flake.modules.nixos.dm_gdm = {
    services.displayManager.gdm = {
      enable = true;
    };
  };
}
