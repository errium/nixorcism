{
  flake.modules.nixos.ly = {
    services.displayManager.ly = {
      enable = true;

      settings = {
        # General
        allow_empty_password = true;
        clear_password = true;
        shell = false;

        # Visual
        animation = "matrix";
        auth_fails = 5;
        bigclock = "en";
      };
    };
  };
}
