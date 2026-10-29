{
  flake.modules.nixos.display-managers'gdm = {
    services.displayManager.gdm = {
      enable = true;
      autoSuspend = true;
    };
  };
}
