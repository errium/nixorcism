{
  flake.modules.nixos.service_openssh = {
    services.openssh.enable = true;
  };
}
