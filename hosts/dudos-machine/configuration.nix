{inputs, ...}: {
  flake.modules.nixos.dudos-machine = {
    imports = [
      inputs.nixos-hardware.nixosModules.lenovo-legion-16aph8
      ./_hardware.nix
    ];

    system.stateVersion = "25.11";

    nixorcism = {
      bootloader = "systemd-boot";
      preservation.enable = true;
    };
  };
}
