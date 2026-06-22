{
  flake.modules.nixos.virtual-nix = {pkgs, ...}: {
    imports = [./_hardware.nix];
    system.stateVersion = "25.11";

    boot.kernelPackages = pkgs.linuxPackages_latest;
    # users.defaultUserShell = pkgs.fish;

    nixorcism.bootloader = "systemd-boot";
  };
}
