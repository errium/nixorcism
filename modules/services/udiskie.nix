{
  flake.modules.nixos.udiskie = {
    services.udisks2 = {
      enable = true;
    };

    hm.services.udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "never";
    };
  };
}
