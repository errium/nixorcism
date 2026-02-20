{
  config,
  pkgs,
  ...
}: {
  flake.modules.nixos.virtual-nix = {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    networking.hostName = "virtual-nix";
    system.stateVersion = "25.11";

    imports =
      (with config.flake.modules.nixos; [
        sway
      ])
      + [./_hardware-configuration.nix];
  };
}
