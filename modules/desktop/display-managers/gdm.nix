{
  flake.modules.nixos.display-manager_gdm = {
    services.displayManager.gdm = {
      enable = true;
    };
  };
}
