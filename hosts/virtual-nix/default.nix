{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      foot
      helix
      ly
      openssh
      xfce
    ];
  };
}
