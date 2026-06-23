{
  flake.modules.nixos.virtual-nix = {pkgs, ...}: {
    imports = [./_hardware.nix];

    system.stateVersion = "25.11";
    boot.kernelPackages = pkgs.linuxPackages_latest;

    nixorcism.bootloader = "systemd-boot";
  };
}
