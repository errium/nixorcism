{
  flake.modules.nixos.feature_podman = {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
