{config, ...}: {
  flake.modules.nixos.virtual-nix = {
    imports = with config.flake.modules.nixos; [
      core
    ];
  };
}
