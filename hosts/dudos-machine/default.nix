{config, ...}: {
  flake.modules.nixos.dudos-machine = {
    imports = with config.flake.modules.nixos; [
      # STUB
    ];
  };
}
