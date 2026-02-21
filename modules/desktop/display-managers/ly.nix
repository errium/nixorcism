{
  flake.modules.nixos.display-manager_ly = {
    services.displayManager.ly = {
      enable = true;

      settings = {
        allow_empty_password = true;
        auth_fails = 5;
        clear_password = true;
      };
    };
  };
}
