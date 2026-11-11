{inputs, ...}: {
  flake.modules.nixos.probably-prod = {
    imports = [
      inputs.nixos-hardware.nixosModules.lenovo-legion-16aph8
      ./_hardware.nix
    ];

    system.stateVersion = "25.11";

    nixorcism = {
      bootloader = "limine";
      preservation.enable = true;
    };
  };
}
