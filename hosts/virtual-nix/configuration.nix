{
  flake.modules.nixos.virtual-nix = {...}: {
    imports = [./_hardware.nix];

    system.stateVersion = "25.11";

    nixorcism = {
      bootloader = "limine";
      preservation.enable = true;
    };
  };
}
